import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:async'; // Add this import for Timer
import 'models/transaction.dart';
import 'controllers/transaction_controller.dart';
import 'package:fl_chart/fl_chart.dart';

// 添加一个新的 provider 来监听交易列表的变化
final transactionListProvider =
    StateNotifierProvider<TransactionController, List<Transaction>>((ref) {
  return TransactionController();
});

class ExpenseTrackerPage extends ConsumerStatefulWidget {
  const ExpenseTrackerPage({super.key});

  @override
  ConsumerState<ExpenseTrackerPage> createState() => _ExpenseTrackerPageState();
}

class _ExpenseTrackerPageState extends ConsumerState<ExpenseTrackerPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<List<Transaction>>(transactionListProvider, (previous, next) {
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTransactionDialog(context, ref),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
            Tab(icon: Icon(Icons.pie_chart), text: 'Analysis'),
            Tab(icon: Icon(Icons.account_balance_wallet), text: 'Budget'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OverviewTab(),
          AnalysisTab(),
          BudgetTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTransactionDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTransactionDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const AddTransactionWidget();
      },
    );
  }
}

class OverviewTab extends ConsumerWidget {
  const OverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ListView(
        children: const [
          FinancialOverviewWidget(),
          ExpenseDistributionWidget(),
          ExpenseListWidget(),
        ],
      ),
    );
  }
}

class AnalysisTab extends ConsumerWidget {
  const AnalysisTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionListProvider);
    final categories = transactions.map((t) => t.category).toSet().toList();
    final categoryTotals = Map.fromEntries(
      categories.map((category) => MapEntry(
            category,
            transactions
                .where((t) => t.category == category)
                .fold(0.0, (sum, t) => sum + t.amount.abs()),
          )),
    );

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Expense Analysis',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        AspectRatio(
          aspectRatio: 1.3,
          child: PieChart(
            PieChartData(
              sections: categoryTotals.entries
                  .map((entry) => PieChartSectionData(
                        color: Colors.primaries[categories.indexOf(entry.key) %
                            Colors.primaries.length],
                        value: entry.value,
                        title:
                            '${entry.key}\n${entry.value.toStringAsFixed(2)}',
                        radius: 100,
                        titleStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                  .toList(),
            ),
          ),
        ),
        // 这里可以添加更多分析图表或数据
      ],
    );
  }
}

class BudgetTab extends ConsumerStatefulWidget {
  const BudgetTab({super.key});

  @override
  ConsumerState<BudgetTab> createState() => _BudgetTabState();
}

class _BudgetTabState extends ConsumerState<BudgetTab> {
  final Map<String, double> _budgets = {
    'Food': 1000,
    'Transport': 500,
    'Shopping': 1500,
    'Other': 1000,
  };

  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionListProvider);
    final now = DateTime.now();
    final thisMonthTransactions = transactions
        .where((t) => t.date.year == now.year && t.date.month == now.month);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Monthly Budget',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        ..._budgets.entries.map((entry) {
          final category = entry.key;
          final budget = entry.value;
          final spent = thisMonthTransactions
              .where((t) => t.category == category)
              .fold(0.0, (sum, t) => sum + t.amount.abs());
          final progress = (spent / budget).clamp(0.0, 1.0);

          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                LinearProgressIndicator(value: progress),
                const SizedBox(height: 4),
                Text(
                    '${spent.toStringAsFixed(2)} / ${budget.toStringAsFixed(2)}'),
              ],
            ),
          );
        }).toList(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: _showEditBudgetDialog,
            child: const Text('Edit Budget'),
          ),
        ),
      ],
    );
  }

  void _showEditBudgetDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Budget'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _budgets.entries.map((entry) {
                return TextField(
                  decoration: InputDecoration(labelText: entry.key),
                  keyboardType: TextInputType.number,
                  controller:
                      TextEditingController(text: entry.value.toString()),
                  onChanged: (value) {
                    setState(() {
                      _budgets[entry.key] =
                          double.tryParse(value) ?? entry.value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class FinancialOverviewWidget extends ConsumerWidget {
  const FinancialOverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final income =
        ref.watch(transactionListProvider.notifier).getTotalIncomeByMonth(now);
    final expense =
        ref.watch(transactionListProvider.notifier).getTotalExpenseByMonth(now);
    final balance = income - expense;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOverviewItem(context, 'Income', income, Colors.green),
                _buildOverviewItem(context, 'Expense', expense, Colors.red),
                _buildOverviewItem(context, 'Balance', balance, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewItem(
      BuildContext context, String title, double amount, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}

class ExpenseDistributionWidget extends ConsumerWidget {
  const ExpenseDistributionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final distribution = ref
        .watch(transactionListProvider.notifier)
        .getExpenseDistributionByMonth(now);

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: PieChart(
        PieChartData(
          sections: distribution.entries
              .map((entry) => PieChartSectionData(
                    title: entry.key,
                    value: entry.value,
                    color: Colors.primaries[
                        distribution.keys.toList().indexOf(entry.key) %
                            Colors.primaries.length],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ExpenseListWidget extends ConsumerWidget {
  const ExpenseListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionListProvider);
    final sortedTransactions = transactions.toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    return Card(
      margin: const EdgeInsets.all(16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sortedTransactions.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final transaction = sortedTransactions[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _getCategoryColor(transaction.category),
              child: Icon(_getCategoryIcon(transaction.category),
                  color: Colors.white),
            ),
            title: Text(transaction.title),
            subtitle: Text(DateFormat('MMM d, yyyy').format(transaction.date)),
            trailing: Text(
              '\$${transaction.amount.abs().toStringAsFixed(2)}',
              style: TextStyle(
                color: transaction.amount > 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.restaurant;
      case 'Transport':
        return Icons.directions_bus;
      case 'Shopping':
        return Icons.shopping_cart;
      default:
        return Icons.category;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.orange;
      case 'Transport':
        return Colors.blue;
      case 'Shopping':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

class AddTransactionWidget extends ConsumerStatefulWidget {
  const AddTransactionWidget({Key? key}) : super(key: key);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends ConsumerState<AddTransactionWidget> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  double _amount = 0;
  String _category = 'Food';
  DateTime _date = DateTime.now();
  String _note = '';
  bool _isExpense = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Add New Transaction',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment<bool>(value: true, label: Text('Expense')),
                ButtonSegment<bool>(value: false, label: Text('Income')),
              ],
              selected: {_isExpense},
              onSelectionChanged: (Set<bool> newSelection) {
                setState(() {
                  _isExpense = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (value) => _title = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid amount';
                }
                return null;
              },
              onSaved: (value) => _amount = double.parse(value!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              value: _category,
              items: ['Food', 'Transport', 'Shopping', 'Other']
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _category = value!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
              ),
              onSaved: (value) => _note = value ?? '',
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final transaction = Transaction(
        id: const Uuid().v4(),
        title: _title,
        amount: _isExpense ? -_amount : _amount,
        date: _date,
        category: _category,
        note: _note,
      );
      ref.read(transactionListProvider.notifier).addTransaction(transaction);
      Navigator.pop(context);
    }
  }
}
