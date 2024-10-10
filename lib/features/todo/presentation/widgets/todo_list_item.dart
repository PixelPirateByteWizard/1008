import 'package:flutter/material.dart';
import '../../domain/entities/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TodoListItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.description),
          Text('Due: ${todo.dueDate.toString().substring(0, 16)}'),
          Text('Category: ${todo.category}'),
          _getPriorityText(todo.priority),
        ],
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) => onToggle(),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  Widget _getPriorityText(Priority priority) {
    String text;
    Color color;

    switch (priority) {
      case Priority.high:
        text = 'High Priority';
        color = Colors.red;
        break;
      case Priority.medium:
        text = 'Medium Priority';
        color = Colors.orange;
        break;
      case Priority.low:
        text = 'Low Priority';
        color = Colors.green;
        break;
    }

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}