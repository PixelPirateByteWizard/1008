import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final List<ShoppingList> _lists = [];
  ShoppingList? _currentList;
  double _budget = 0;

  final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.teal,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_currentList?.name ?? 'Shopping List'),
          actions: [
            if (_currentList != null)
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addItem,
              ),
          ],
        ),
        body:
            _currentList == null ? _buildListSelector() : _buildShoppingList(),
        floatingActionButton: FloatingActionButton(
          onPressed: _createNewList,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildListSelector() {
    if (_lists.isEmpty) {
      return Center(
        child: Text(
            'No shopping lists yet. Tap the button in the bottom right to create one!'),
      );
    }
    return ListView.builder(
      itemCount: _lists.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading:
                Icon(Icons.shopping_cart, color: theme.colorScheme.primary),
            title: Text(_lists[index].name),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              setState(() {
                _currentList = _lists[index];
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildShoppingList() {
    if (_currentList!.items.isEmpty) {
      return Center(
        child: Text(
            'The list is empty. \nTap the add button to start adding items!'),
      );
    }
    final unpurchasedItems =
        _currentList!.items.where((item) => !item.isPurchased).toList();
    final purchasedItems =
        _currentList!.items.where((item) => item.isPurchased).toList();

    return Column(
      children: [
        _buildBudgetInfo(),
        Expanded(
          child: ListView(
            children: [
              _buildItemList('To Buy', unpurchasedItems, Colors.orange),
              _buildItemList('Purchased', purchasedItems, Colors.green),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetInfo() {
    final totalSpent = _currentList!.items
        .where((item) => item.isPurchased && item.price != null)
        .fold(0.0, (sum, item) => sum + (item.price! * item.quantity));
    final remaining = _budget - totalSpent;

    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Budget Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBudgetItem('Budget', _budget, Colors.blue),
                _buildBudgetItem('Spent', totalSpent, Colors.red),
                _buildBudgetItem('Remaining', remaining, Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetItem(String label, double amount, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: color)),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  Widget _buildItemList(String title, List<ShoppingItem> items, Color color) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        children: items
            .map((item) => ShoppingItemWidget(
                  item: item,
                  onToggle: () => _toggleItem(item),
                  onDelete: () => _deleteItem(item),
                  onEdit: () => _editItem(item),
                ))
            .toList(),
      ),
    );
  }

  void _createNewList() {
    showDialog(
      context: context,
      builder: (context) {
        String listName = '';
        return AlertDialog(
          title: const Text('Create New Shopping List'),
          content: TextField(
            onChanged: (value) => listName = value,
            decoration: const InputDecoration(hintText: 'Enter list name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (listName.isNotEmpty) {
                  setState(() {
                    _lists.add(ShoppingList(name: listName));
                    _currentList = _lists.last;
                  });
                  Navigator.pop(context);
                  _setBudget();
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _setBudget() {
    showDialog(
      context: context,
      builder: (context) {
        String budgetStr = '';
        return AlertDialog(
          title: const Text('Set Budget'),
          content: TextField(
            onChanged: (value) => budgetStr = value,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(hintText: 'Enter budget amount'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (budgetStr.isNotEmpty) {
                  double? parsedBudget = double.tryParse(budgetStr);
                  if (parsedBudget != null && parsedBudget > 0) {
                    setState(() {
                      _budget = parsedBudget;
                    });
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Please enter a valid positive number')),
                    );
                  }
                }
              },
              child: const Text('Set'),
            ),
          ],
        );
      },
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        int quantity = 1;
        String priceStr = '';
        String category = 'Uncategorized';
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => name = value,
                decoration: const InputDecoration(hintText: 'Item Name'),
              ),
              TextField(
                onChanged: (value) => quantity = int.tryParse(value) ?? 1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Quantity'),
              ),
              TextField(
                onChanged: (value) => priceStr = value,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Price (optional)'),
              ),
              TextField(
                onChanged: (value) => category = value,
                decoration: const InputDecoration(hintText: 'Category'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  setState(() {
                    _currentList!.items.add(ShoppingItem(
                      name: name,
                      quantity: quantity,
                      price:
                          priceStr.isNotEmpty ? double.parse(priceStr) : null,
                      category: category,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _toggleItem(ShoppingItem item) {
    setState(() {
      item.isPurchased = !item.isPurchased;
    });
  }

  void _deleteItem(ShoppingItem item) {
    setState(() {
      _currentList!.items.remove(item);
    });
  }

  void _editItem(ShoppingItem item) {
    showDialog(
      context: context,
      builder: (context) {
        String name = item.name;
        int quantity = item.quantity;
        String priceStr = item.price?.toString() ?? '';
        String category = item.category;
        return AlertDialog(
          title: const Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => name = value,
                decoration: const InputDecoration(hintText: 'Item Name'),
                controller: TextEditingController(text: name),
              ),
              TextField(
                onChanged: (value) =>
                    quantity = int.tryParse(value) ?? quantity,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Quantity'),
                controller: TextEditingController(text: quantity.toString()),
              ),
              TextField(
                onChanged: (value) => priceStr = value,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Price (optional)'),
                controller: TextEditingController(text: priceStr),
              ),
              TextField(
                onChanged: (value) => category = value,
                decoration: const InputDecoration(hintText: 'Category'),
                controller: TextEditingController(text: category),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  setState(() {
                    item.name = name;
                    item.quantity = quantity;
                    item.price =
                        priceStr.isNotEmpty ? double.parse(priceStr) : null;
                    item.category = category;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ShoppingList {
  String name;
  List<ShoppingItem> items;

  ShoppingList({required this.name, List<ShoppingItem>? items})
      : items = items ?? [];
}

class ShoppingItem {
  String name;
  int quantity;
  double? price;
  bool isPurchased;
  String category;

  ShoppingItem({
    required this.name,
    required this.quantity,
    this.price,
    this.isPurchased = false,
    this.category = 'Uncategorized',
  });
}

class ShoppingItemWidget extends StatelessWidget {
  final ShoppingItem item;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ShoppingItemWidget({
    super.key,
    required this.item,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: item.isPurchased,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            decoration: item.isPurchased ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          'Quantity: ${item.quantity}, Category: ${item.category}, Price: ${item.price != null ? '\$${item.price!.toStringAsFixed(2)}' : 'Not set'}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
