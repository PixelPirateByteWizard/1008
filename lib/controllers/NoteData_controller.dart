import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note_data.dart';

class NoteDataController extends StateNotifier<List<NoteData>> {
  NoteDataController() : super([]);

  void addNoteData(NoteData NoteData) {
    state = [...state, NoteData];
  }

  void removeNoteData(String id) {
    state = state.where((NoteData) => NoteData.id != id).toList();
  }

  List<NoteData> getNoteDatasByMonth(DateTime date) {
    return state
        .where((NoteData) =>
            NoteData.date.year == date.year &&
            NoteData.date.month == date.month)
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
    for (var NoteData in state.where((t) =>
        t.date.year == date.year &&
        t.date.month == date.month &&
        t.amount < 0)) {
      expensesByCategory[NoteData.category] =
          (expensesByCategory[NoteData.category] ?? 0) + NoteData.amount.abs();
    }
    return expensesByCategory;
  }
}

final NoteDataControllerProvider =
    StateNotifierProvider<NoteDataController, List<NoteData>>(
        (ref) => NoteDataController());
