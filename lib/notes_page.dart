import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Note {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final List<String> tags;
  final String category;
  final bool isCompleted;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.tags,
    required this.category,
    this.isCompleted = false,
  });

  Note copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    List<String>? tags,
    String? category,
    bool? isCompleted,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

final notesProvider =
    StateNotifierProvider<NotesNotifier, List<Note>>((ref) => NotesNotifier());

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super([]);

  void addNote(Note note) {
    state = [...state, note];
  }

  void updateNote(Note updatedNote) {
    state = [
      for (final note in state)
        if (note.id == updatedNote.id) updatedNote else note
    ];
  }

  void deleteNote(String id) {
    state = state.where((note) => note.id != id).toList();
  }

  void toggleNoteCompletion(String id) {
    state = [
      for (final note in state)
        if (note.id == id)
          note.copyWith(isCompleted: !note.isCompleted)
        else
          note
    ];
  }
}

class NotesPage extends ConsumerStatefulWidget {
  const NotesPage({super.key});

  @override
  ConsumerState<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends ConsumerState<NotesPage> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Work', 'Personal', 'Study'];

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);
    final filteredNotes = _filterNotes(notes);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showNoteDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                final note = filteredNotes[index];
                return _buildNoteCard(note);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search notes...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(category),
              selected: _selectedCategory == category,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNoteCard(Note note) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(
          note.title,
          style: TextStyle(
            decoration: note.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.content),
            Wrap(
              spacing: 4.0,
              children: note.tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _showNoteDialog(context, existingNote: note),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () =>
                  ref.read(notesProvider.notifier).deleteNote(note.id),
            ),
            if (note.category == 'Task')
              Checkbox(
                value: note.isCompleted,
                onChanged: (_) => ref
                    .read(notesProvider.notifier)
                    .toggleNoteCompletion(note.id),
              ),
          ],
        ),
        onTap: () => _showNoteDialog(context, existingNote: note),
      ),
    );
  }

  List<Note> _filterNotes(List<Note> notes) {
    return notes.where((note) {
      final matchesSearch = note.title
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          note.content.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          note.tags.any(
              (tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase()));
      final matchesCategory =
          _selectedCategory == 'All' || note.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void _showNoteDialog(BuildContext context, {Note? existingNote}) {
    final titleController =
        TextEditingController(text: existingNote?.title ?? '');
    final contentController =
        TextEditingController(text: existingNote?.content ?? '');
    final tagsController =
        TextEditingController(text: existingNote?.tags.join(', ') ?? '');
    String selectedCategory = existingNote?.category ?? _categories[1];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(existingNote == null ? 'Add Note' : 'Edit Note'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: 'Content'),
                  maxLines: 3,
                ),
                TextField(
                  controller: tagsController,
                  decoration: const InputDecoration(
                      labelText: 'Tags (comma-separated)'),
                ),
                DropdownButton<String>(
                  value: selectedCategory,
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedCategory = value;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final note = Note(
                  id: existingNote?.id ?? DateTime.now().toString(),
                  title: titleController.text,
                  content: contentController.text,
                  createdAt: existingNote?.createdAt ?? DateTime.now(),
                  tags: tagsController.text
                      .split(',')
                      .map((e) => e.trim())
                      .toList(),
                  category: selectedCategory,
                  isCompleted: existingNote?.isCompleted ?? false,
                );

                if (existingNote == null) {
                  ref.read(notesProvider.notifier).addNote(note);
                } else {
                  ref.read(notesProvider.notifier).updateNote(note);
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
