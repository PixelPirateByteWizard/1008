import 'package:flutter/material.dart';
import '../models/shopping_item.dart';
import '../services/storage_service.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<ShoppingItem> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String _selectedCategory = 'Groceries';
  late StorageService _storage;
  bool _isLoading = true;
  SortOption _currentSortOption = SortOption.createdAt;
  bool _sortAscending = true;

  final List<String> _categories = [
    'Groceries',
    'Household',
    'Electronics',
    'Clothing',
    'Other'
  ];

  @override
  void initState() {
    super.initState();
    _initializeStorage();
  }

  Future<void> _initializeStorage() async {
    _storage = await StorageService.init();
    await _loadItems();
  }

  Future<void> _loadItems() async {
    final itemsJson = await _storage.getShoppingList();
    setState(() {
      _items.clear();
      _items.addAll(
        itemsJson.map((json) => ShoppingItem.fromJson(json)).toList(),
      );
      _isLoading = false;
      _sortItems();
    });
  }

  Future<void> _saveItems() async {
    await _storage.saveShoppingList(
      _items.map((item) => item.toJson()).toList(),
    );
  }

  void _sortItems() {
    setState(() {
      switch (_currentSortOption) {
        case SortOption.name:
          _items.sort((a, b) => _sortAscending
              ? a.name.compareTo(b.name)
              : b.name.compareTo(a.name));
          break;
        case SortOption.category:
          _items.sort((a, b) => _sortAscending
              ? a.category.compareTo(b.category)
              : b.category.compareTo(a.category));
          break;
        case SortOption.quantity:
          _items.sort((a, b) => _sortAscending
              ? a.quantity.compareTo(b.quantity)
              : b.quantity.compareTo(a.quantity));
          break;
        case SortOption.createdAt:
          _items.sort((a, b) => _sortAscending
              ? a.createdAt.compareTo(b.createdAt)
              : b.createdAt.compareTo(a.createdAt));
          break;
        case SortOption.completion:
          _items.sort((a, b) {
            if (a.isCompleted == b.isCompleted) {
              return _sortAscending
                  ? a.name.compareTo(b.name)
                  : b.name.compareTo(a.name);
            }
            return _sortAscending
                ? (a.isCompleted ? 1 : -1)
                : (a.isCompleted ? -1 : 1);
          });
          break;
      }
    });
  }

  void _addItem() {
    if (_nameController.text.isEmpty || _quantityController.text.isEmpty) {
      return;
    }

    setState(() {
      _items.add(
        ShoppingItem(
          id: DateTime.now().toString(),
          name: _nameController.text,
          quantity: int.parse(_quantityController.text),
          category: _selectedCategory,
          note: _noteController.text.isEmpty ? null : _noteController.text,
          createdAt: DateTime.now(),
        ),
      );
      _sortItems();
    });

    _saveItems();
    _nameController.clear();
    _quantityController.clear();
    _noteController.clear();
    Navigator.pop(context);
  }

  void _toggleItemCompletion(int index) {
    setState(() {
      final item = _items[index];
      _items[index] = item.copyWith(
        isCompleted: !item.isCompleted,
        completedAt: !item.isCompleted ? DateTime.now() : null,
      );
      _sortItems();
    });
    _saveItems();
  }

  void _showAddItemDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Shopping Item',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.category_outlined),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Note (Optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.note_outlined),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addItem,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add Item',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sort Options',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _sortAscending
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _sortAscending = !_sortAscending;
                        _sortItems();
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ...SortOption.values.map((option) => ListTile(
                  leading: Radio<SortOption>(
                    value: option,
                    groupValue: _currentSortOption,
                    onChanged: (SortOption? value) {
                      if (value != null) {
                        setState(() {
                          _currentSortOption = value;
                          _sortItems();
                        });
                        Navigator.pop(context);
                      }
                    },
                  ),
                  title: Text(
                    option.displayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _currentSortOption = option;
                      _sortItems();
                    });
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Shopping List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black54),
            onPressed: _showSortOptions,
            tooltip: 'Sort items',
          ),
        ],
      ),
      body: _items.isEmpty ? _buildEmptyState() : _buildShoppingList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddItemDialog,
        icon: const Icon(Icons.add),
        label: const Text('Add Item'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_cart.png', // 需要添加相应的图片资源
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 24),
          Text(
            'Your Shopping List is Empty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items to get started',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingList() {
    return ListView.builder(
      itemCount: _items.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          key: Key(item.id),
          background: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete_outline,
              color: Colors.white,
              size: 24,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              _items.removeAt(index);
            });
            _saveItems();
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: item.isCompleted
                      ? Colors.green.withOpacity(0.1)
                      : Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  item.isCompleted ? Icons.check_circle : Icons.shopping_bag,
                  color: item.isCompleted
                      ? Colors.green
                      : Theme.of(context).primaryColor,
                ),
              ),
              title: Text(
                item.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration:
                      item.isCompleted ? TextDecoration.lineThrough : null,
                  color: item.isCompleted ? Colors.grey : Colors.black87,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    'Quantity: ${item.quantity}',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  if (item.note != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.note!,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(item.category).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item.category,
                      style: TextStyle(
                        color: _getCategoryColor(item.category),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(
                      item.isCompleted
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: item.isCompleted ? Colors.green : Colors.grey,
                    ),
                    onPressed: () => _toggleItemCompletion(index),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Groceries':
        return Colors.green;
      case 'Household':
        return Colors.blue;
      case 'Electronics':
        return Colors.orange;
      case 'Clothing':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}

enum SortOption {
  name('Name'),
  category('Category'),
  quantity('Quantity'),
  createdAt('Date Created'),
  completion('Completion Status');

  final String displayName;
  const SortOption(this.displayName);
}
