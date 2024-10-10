import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/todo_controller.dart';
import '../widgets/todo_list_item.dart';
import '../widgets/add_todo_dialog.dart';
import '../../domain/entities/todo.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTodoDialog(context, ref),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoListItem(
            todo: todo,
            onToggle: () => ref.read(todoControllerProvider.notifier).toggleTodoCompletion(todo.id),
            onDelete: () => ref.read(todoControllerProvider.notifier).deleteTodo(todo.id),
            onEdit: () => _showEditTodoDialog(context, ref, todo),
          );
        },
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        onAdd: (title, description, dueDate, priority, category) {
          ref.read(todoControllerProvider.notifier).addTodo(
            title,
            description,
            dueDate,
            priority,
            category,
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showEditTodoDialog(BuildContext context, WidgetRef ref, Todo todo) {
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        initialTitle: todo.title,
        initialDescription: todo.description,
        initialDueDate: todo.dueDate,
        initialPriority: todo.priority,
        initialCategory: todo.category,
        onAdd: (title, description, dueDate, priority, category) {
          ref.read(todoControllerProvider.notifier).editTodo(
            todo.id,
            title: title,
            description: description,
            dueDate: dueDate,
            priority: priority,
            category: category,
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }
}