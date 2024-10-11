import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';

class TransactionController extends StateNotifier<List<Transaction>> {
  TransactionController() : super([]);

  void addTransaction(Transaction transaction) {
    state = [...state, transaction];
  }

  void removeTransaction(String id) {
    state = state.where((transaction) => transaction.id != id).toList();
  }

  List<Transaction> getTransactionsByMonth(DateTime date) {
    return state
        .where((transaction) =>
            transaction.date.year == date.year &&
            transaction.date.month == date.month)
        .toList();
  }

  // 添加这些方法来计算总收入和支出
  double getTotalIncomeByMonth(DateTime date) {
    return state
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.amount > 0)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double getTotalExpenseByMonth(DateTime date) {
    return state
        .where((t) =>
            t.date.year == date.year &&
            t.date.month == date.month &&
            t.amount < 0)
        .fold(0, (sum, t) => sum + t.amount.abs());
  }

  Map<String, double> getExpenseDistributionByMonth(DateTime date) {
    final expensesByCategory = <String, double>{};
    for (var transaction in state.where((t) =>
        t.date.year == date.year &&
        t.date.month == date.month &&
        t.amount < 0)) {
      expensesByCategory[transaction.category] =
          (expensesByCategory[transaction.category] ?? 0) +
              transaction.amount.abs();
    }
    return expensesByCategory;
  }
}

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, List<Transaction>>(
        (ref) => TransactionController());
