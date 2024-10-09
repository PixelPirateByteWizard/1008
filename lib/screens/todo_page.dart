import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoPage extends StatefulWidget {
  final List<TodoItem> todos;

  const TodoPage({super.key, required this.todos});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late List<TodoItem> _todos;
  List<TodoItem> _filteredTodos = [];
  String _searchQuery = '';
  bool _showCompleted = false;
  Priority? _filterPriority;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    _todos = widget.todos;
    _filteredTodos = _todos;
    _searchController.addListener(_updateSearch);
  }

  @override
  void dispose() {
    _searchController.removeListener(_updateSearch);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrioritEase'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchBar,
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isSearchVisible)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search tasks...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearSearch,
                  ),
                ),
              ),
            ),
          Expanded(
            child: _filteredTodos.isEmpty
                ? const Center(
                    child: Text(
                        'No matching tasks found \nTap the add button to start adding items!',
                        style: TextStyle(fontSize: 16)),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemCount: _filteredTodos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: TodoItemWidget(
                          todo: _filteredTodos[index],
                          onToggle: () => _toggleTodo(_filteredTodos[index]),
                          onDelete: () => _deleteTodo(_filteredTodos[index]),
                          onEdit: () => _editTodo(_filteredTodos[index]),
                          searchQuery: _searchQuery,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  void _showSearchBar() {
    setState(() {
      _isSearchVisible = true;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  void _updateSearch() {
    setState(() {
      _searchQuery = _searchController.text;
      _filterTodos();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchQuery = '';
      _searchController.clear();
      _isSearchVisible = false;
      _filterTodos();
    });
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: const Text('Show completed tasks'),
                value: _showCompleted,
                onChanged: (value) {
                  setState(() {
                    _showCompleted = value!;
                    _filterTodos();
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              const Text('Filter by priority:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<Priority?>(
                value: _filterPriority,
                isExpanded: true,
                items: [
                  const DropdownMenuItem(value: null, child: Text('All')),
                  ...Priority.values.map((p) => DropdownMenuItem(
                      value: p, child: Text(_getPriorityString(p)))),
                ],
                onChanged: (value) {
                  setState(() {
                    _filterPriority = value;
                    _filterTodos();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _filterTodos() {
    setState(() {
      _filteredTodos = _todos.where((todo) {
        if (!_showCompleted && todo.isCompleted) return false;
        if (_filterPriority != null && todo.priority != _filterPriority)
          return false;
        if (_searchQuery.isNotEmpty) {
          final keywords = _searchQuery.toLowerCase().split(' ');
          return keywords.every((keyword) =>
              todo.title.toLowerCase().contains(keyword) ||
              todo.description.toLowerCase().contains(keyword));
        }
        return true;
      }).toList();

      _filteredTodos.sort((a, b) {
        if (a.isCompleted != b.isCompleted) {
          return a.isCompleted ? 1 : -1;
        }
        if (a.priority != b.priority) {
          return b.priority.index - a.priority.index;
        }
        return a.deadline.compareTo(b.deadline);
      });
    });
  }

  String _getPriorityString(Priority priority) {
    switch (priority) {
      case Priority.low:
        return 'Low';
      case Priority.medium:
        return 'Medium';
      case Priority.high:
        return 'High';
      default:
        return '';
    }
  }

  void _addTodo() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        DateTime deadline = DateTime.now();
        Priority priority = Priority.medium;

        return AlertDialog(
          title: const Text('Add New Task'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) => title = value,
                  decoration: const InputDecoration(
                    hintText: 'Task title',
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 225, 225),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) => description = value,
                  decoration: const InputDecoration(
                    hintText: 'Task description',
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 225, 225),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Deadline'),
                  subtitle: Text(DateFormat('yyyy-MM-dd').format(deadline)),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: deadline,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() {
                        deadline = date;
                      });
                    }
                  },
                ),
                DropdownButton<Priority>(
                  value: priority,
                  items: Priority.values
                      .map((p) => DropdownMenuItem(
                          value: p, child: Text(_getPriorityString(p))))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      priority = value!;
                    });
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
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty) {
                  setState(() {
                    _todos.add(TodoItem(
                      title: title,
                      description: description,
                      deadline: deadline,
                      priority: priority,
                    ));
                    _filterTodos();
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

  void _toggleTodo(TodoItem todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;
      _filterTodos();
    });
  }

  void _deleteTodo(TodoItem todo) {
    setState(() {
      _todos.remove(todo);
      _filterTodos();
    });
  }

  void _editTodo(TodoItem todo) {
    showDialog(
      context: context,
      builder: (context) {
        String title = todo.title;
        String description = todo.description;
        DateTime deadline = todo.deadline;
        Priority priority = todo.priority;

        return AlertDialog(
          title: const Text('Edit Task'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) => title = value,
                  decoration: const InputDecoration(
                    hintText: 'Task title',
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 225, 225),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: TextEditingController(text: title),
                ),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) => description = value,
                  decoration: const InputDecoration(
                    hintText: 'Task description',
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 225, 225),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: TextEditingController(text: description),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: const Text('Deadline'),
                  subtitle: Text(DateFormat('yyyy-MM-dd').format(deadline)),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: deadline,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() {
                        deadline = date;
                      });
                    }
                  },
                ),
                DropdownButton<Priority>(
                  value: priority,
                  items: Priority.values
                      .map((p) => DropdownMenuItem(
                          value: p, child: Text(_getPriorityString(p))))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      priority = value!;
                    });
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
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty) {
                  setState(() {
                    todo.title = title;
                    todo.description = description;
                    todo.deadline = deadline;
                    todo.priority = priority;
                    _filterTodos();
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

class TodoItem {
  String title;
  String description;
  DateTime deadline;
  bool isCompleted;
  Priority priority;

  TodoItem({
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
    this.priority = Priority.medium,
  });
}

enum Priority { low, medium, high }

class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final String searchQuery;

  const TodoItemWidget({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _highlightText(todo.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(todo.isCompleted
                          ? Icons.check_circle
                          : Icons.check_circle_outline),
                      onPressed: onToggle,
                      color: todo.isCompleted ? Colors.green : Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: onEdit,
                      color: Colors.blue,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: onDelete,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            _highlightText(todo.description),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Deadline: ${DateFormat('yyyy-MM-dd').format(todo.deadline)}'),
                _buildPriorityChip(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityChip(BuildContext context) {
    Color chipColor;
    switch (todo.priority) {
      case Priority.low:
        chipColor = Colors.green;
        break;
      case Priority.medium:
        chipColor = Colors.orange;
        break;
      case Priority.high:
        chipColor = Colors.red;
        break;
    }

    return Chip(
      label: Text(
        _getPriorityString(todo.priority),
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: chipColor,
    );
  }

  Widget _highlightText(String text, {TextStyle? style}) {
    if (searchQuery.isEmpty) {
      return Text(
        text,
        style: style?.copyWith(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      );
    }

    final List<TextSpan> spans = [];
    final lowercaseText = text.toLowerCase();
    final lowercaseQuery = searchQuery.toLowerCase();
    final keywords = lowercaseQuery.split(' ');

    int start = 0;
    while (start < text.length) {
      int matchIndex = -1;
      int matchLength = 0;
      String matchKeyword = '';

      for (final keyword in keywords) {
        final index = lowercaseText.indexOf(keyword, start);
        if (index != -1 && (matchIndex == -1 || index < matchIndex)) {
          matchIndex = index;
          matchLength = keyword.length;
          matchKeyword = keyword;
        }
      }

      if (matchIndex != -1) {
        if (start != matchIndex) {
          spans.add(TextSpan(text: text.substring(start, matchIndex)));
        }
        spans.add(TextSpan(
          text: text.substring(matchIndex, matchIndex + matchLength),
          style: const TextStyle(
            backgroundColor: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ));
        start = matchIndex + matchLength;
      } else {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
    }

    return RichText(
      text: TextSpan(
        style: style?.copyWith(
          color: Colors.black,
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
        children: spans,
      ),
    );
  }

  String _getPriorityString(Priority priority) {
    switch (priority) {
      case Priority.low:
        return 'Low';
      case Priority.medium:
        return 'Medium';
      case Priority.high:
        return 'High';
      default:
        return '';
    }
  }
}
