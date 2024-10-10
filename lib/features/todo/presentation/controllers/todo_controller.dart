import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/todo.dart';

final todoControllerProvider = StateNotifierProvider<TodoController, List<Todo>>((ref) {
  return TodoController();
});

class TodoController extends StateNotifier<List<Todo>> {
  TodoController() : super([]);

  void addTodo(String title, String description, DateTime dueDate, Priority priority, String category) {
    final newTodo = Todo(
      id: const Uuid().v4(),
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
      category: category,
    );
    state = [...state, newTodo];
  }

  void toggleTodoCompletion(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void editTodo(String id, {String? title, String? description, DateTime? dueDate, Priority? priority, String? category}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(
            title: title ?? todo.title,
            description: description ?? todo.description,
            dueDate: dueDate ?? todo.dueDate,
            priority: priority ?? todo.priority,
            category: category ?? todo.category,
          )
        else
          todo,
    ];
  }
}