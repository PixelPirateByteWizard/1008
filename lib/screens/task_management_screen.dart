import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';
import '../services/storage_service.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({super.key});

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  final List<Task> _tasks = [];
  late StorageService _storage;
  bool _isLoading = true;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDueDate;
  TaskPriority _selectedPriority = TaskPriority.medium;
  final List<String> _selectedTags = [];

  @override
  void initState() {
    super.initState();
    _initializeStorage();
  }

  Future<void> _initializeStorage() async {
    _storage = await StorageService.init();
    await _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasksJson = await _storage.getTasks();
    setState(() {
      _tasks.clear();
      _tasks.addAll(
        tasksJson.map((json) => Task.fromJson(json)).toList(),
      );
      _isLoading = false;
    });
  }

  Future<void> _saveTasks() async {
    await _storage.saveTasks(
      _tasks.map((task) => task.toJson()).toList(),
    );
  }

  void _showAddTaskDialog() {
    _titleController.clear();
    _descriptionController.clear();
    _selectedDueDate = null;
    _selectedPriority = TaskPriority.medium;
    _selectedTags.clear();

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Task',
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
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.task_alt),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.description_outlined),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDueDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() => _selectedDueDate = date);
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 12),
                      Text(
                        _selectedDueDate == null
                            ? 'Select Due Date'
                            : DateFormat('MMM dd, yyyy')
                                .format(_selectedDueDate!),
                        style: TextStyle(
                          color: _selectedDueDate == null
                              ? Colors.grey[600]
                              : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TaskPriority>(
                value: _selectedPriority,
                decoration: InputDecoration(
                  labelText: 'Priority',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(
                    _getPriorityIcon(_selectedPriority),
                    color: _getPriorityColor(_selectedPriority),
                  ),
                ),
                items: TaskPriority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Row(
                      children: [
                        Icon(
                          _getPriorityIcon(priority),
                          color: _getPriorityColor(priority),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          priority.toString().split('.').last.toUpperCase(),
                          style: TextStyle(
                            color: _getPriorityColor(priority),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedPriority = value);
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a task title'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  if (_selectedDueDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a due date'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final newTask = Task(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    dueDate: _selectedDueDate!,
                    priority: _selectedPriority,
                    createdAt: DateTime.now(),
                    tags: _selectedTags,
                  );
                  setState(() {
                    _tasks.add(newTask);
                    _saveTasks();
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8),
                    Text(
                      'Create Task',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteTask(String taskId) {
    setState(() {
      _tasks.removeWhere((task) => task.id == taskId);
      _saveTasks();
    });
  }

  void _toggleTaskStatus(Task task) {
    setState(() {
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        final newStatus = task.status == TaskStatus.completed
            ? TaskStatus.pending
            : TaskStatus.completed;
        final updatedTask = Task(
          id: task.id,
          title: task.title,
          description: task.description,
          dueDate: task.dueDate,
          priority: task.priority,
          status: newStatus,
          assignedTo: task.assignedTo,
          tags: task.tags,
          createdAt: task.createdAt,
          completedAt:
              newStatus == TaskStatus.completed ? DateTime.now() : null,
          isRecurring: task.isRecurring,
          recurrencePattern: task.recurrencePattern,
        );
        _tasks[index] = updatedTask;
        _saveTasks();
      }
    });
  }

  void _showDeleteConfirmationDialog(Task task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: Text('Are you sure you want to delete "${task.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _deleteTask(task.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showEditTaskDialog(Task task) {
    _titleController.text = task.title;
    _descriptionController.text = task.description;
    _selectedDueDate = task.dueDate;
    _selectedPriority = task.priority;
    _selectedTags.clear();
    _selectedTags.addAll(task.tags);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
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
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(DateFormat('yyyy-MM-dd').format(_selectedDueDate!)),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDueDate!,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() => _selectedDueDate = date);
                  }
                },
              ),
              DropdownButtonFormField<TaskPriority>(
                value: _selectedPriority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: TaskPriority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedPriority = value);
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String? errorMessage;
              if (_titleController.text.isEmpty) {
                errorMessage = 'Please enter a title';
              } else if (_selectedDueDate == null) {
                errorMessage = 'Please select a due date';
              }

              if (errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              final updatedTask = Task(
                id: task.id,
                title: _titleController.text,
                description: _descriptionController.text,
                dueDate: _selectedDueDate!,
                priority: _selectedPriority,
                status: task.status,
                assignedTo: task.assignedTo,
                tags: _selectedTags,
                createdAt: task.createdAt,
                completedAt: task.completedAt,
                isRecurring: task.isRecurring,
                recurrencePattern: task.recurrencePattern,
              );
              setState(() {
                final index = _tasks.indexWhere((t) => t.id == task.id);
                if (index != -1) {
                  _tasks[index] = updatedTask;
                  _saveTasks();
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
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
          'Family Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
      ),
      body: _tasks.isEmpty ? _buildEmptyState() : _buildTasksList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddTaskDialog,
        backgroundColor: Theme.of(context).primaryColor,
        icon: const Icon(Icons.add),
        label: const Text('New Task'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Text(
            'No Tasks Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first family task to get started',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];
        return Dismissible(
          key: Key(task.id),
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
          onDismissed: (_) => _deleteTask(task.id),
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
            child: InkWell(
              onTap: () => _showEditTaskDialog(task),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _getPriorityColor(task.priority)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _getPriorityIcon(task.priority),
                            color: _getPriorityColor(task.priority),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: task.status == TaskStatus.completed
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: task.status == TaskStatus.completed
                                  ? Colors.grey
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            task.status == TaskStatus.completed
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: task.status == TaskStatus.completed
                                ? Colors.green
                                : Colors.grey,
                          ),
                          onPressed: () => _toggleTaskStatus(task),
                        ),
                      ],
                    ),
                    if (task.description.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        task.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color:
                              _isOverdue(task) ? Colors.red : Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('MMM dd, yyyy').format(task.dueDate),
                          style: TextStyle(
                            fontSize: 12,
                            color: _isOverdue(task)
                                ? Colors.red
                                : Colors.grey[600],
                          ),
                        ),
                        if (task.tags.isNotEmpty) ...[
                          const SizedBox(width: 16),
                          ...task.tags.map((tag) => Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isOverdue(Task task) {
    return task.status != TaskStatus.completed &&
        task.dueDate.isBefore(DateTime.now());
  }

  IconData _getPriorityIcon(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.urgent:
        return Icons.warning_rounded;
      case TaskPriority.high:
        return Icons.priority_high;
      case TaskPriority.medium:
        return Icons.drag_handle;
      case TaskPriority.low:
        return Icons.arrow_downward;
    }
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.urgent:
        return Colors.deepOrange;
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.low:
        return Colors.green;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
