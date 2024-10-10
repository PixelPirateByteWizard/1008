import 'package:flutter/material.dart';
import '../../domain/entities/todo.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String, String, DateTime, Priority, String) onAdd;
  final String? initialTitle;
  final String? initialDescription;
  final DateTime? initialDueDate;
  final Priority? initialPriority;
  final String? initialCategory;

  const AddTodoDialog({
    super.key,
    required this.onAdd,
    this.initialTitle,
    this.initialDescription,
    this.initialDueDate,
    this.initialPriority,
    this.initialCategory,
  });

  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _dueDate;
  late Priority _priority;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _descriptionController = TextEditingController(text: widget.initialDescription);
    _dueDate = _truncateToSecond(widget.initialDueDate ?? DateTime.now());
    _priority = widget.initialPriority ?? Priority.medium;
    _categoryController = TextEditingController(text: widget.initialCategory);
  }

  DateTime _truncateToSecond(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialTitle == null ? 'Add Todo' : 'Edit Todo'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: null, // 允许无限行数
              keyboardType: TextInputType.multiline, // 使用多行键盘类型
              textInputAction: TextInputAction.newline, // 回车键变为换行
            ),
            ListTile(
              title: const Text('Due Date'),
              subtitle: Text(_dueDate.toString().substring(0, 19)), // Only show up to seconds
              onTap: _selectDate,
            ),
            DropdownButtonFormField<Priority>(
              value: _priority,
              onChanged: (Priority? newValue) {
                setState(() {
                  _priority = newValue!;
                });
              },
              items: Priority.values.map((Priority priority) {
                return DropdownMenuItem<Priority>(
                  value: priority,
                  child: Text(priority.toString().split('.').last),
                );
              }).toList(),
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onAdd(
              _titleController.text,
              _descriptionController.text,
              _dueDate,
              _priority,
              _categoryController.text,
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_dueDate),
      );
      if (pickedTime != null) {
        setState(() {
          _dueDate = _truncateToSecond(DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          ));
        });
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}