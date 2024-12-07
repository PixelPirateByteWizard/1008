class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final TaskPriority priority;
  final TaskStatus status;
  final String? assignedTo;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime? completedAt;
  final bool isRecurring;
  final RecurrencePattern? recurrencePattern;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.status = TaskStatus.pending,
    this.assignedTo,
    this.tags = const [],
    required this.createdAt,
    this.completedAt,
    this.isRecurring = false,
    this.recurrencePattern,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority.toString().split('.').last,
      'status': status.toString().split('.').last,
      'assignedTo': assignedTo,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'isRecurring': isRecurring,
      'recurrencePattern': recurrencePattern?.toJson(),
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      priority: TaskPriority.values
          .firstWhere((e) => e.toString().split('.').last == json['priority']),
      status: TaskStatus.values
          .firstWhere((e) => e.toString().split('.').last == json['status']),
      assignedTo: json['assignedTo'],
      tags: List<String>.from(json['tags']),
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
      isRecurring: json['isRecurring'],
      recurrencePattern: json['recurrencePattern'] != null
          ? RecurrencePattern.fromJson(json['recurrencePattern'])
          : null,
    );
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    TaskPriority? priority,
    TaskStatus? status,
    String? assignedTo,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? completedAt,
    bool? isRecurring,
    RecurrencePattern? recurrencePattern,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      assignedTo: assignedTo ?? this.assignedTo,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
    );
  }
}

enum TaskPriority {
  urgent,
  high,
  medium,
  low,
}

enum TaskStatus { pending, inProgress, completed, cancelled, overdue }

class RecurrencePattern {
  final RecurrenceType type;
  final int interval;
  final List<int>? daysOfWeek; // For weekly recurrence
  final int? dayOfMonth; // For monthly recurrence
  final DateTime? endDate;

  RecurrencePattern({
    required this.type,
    required this.interval,
    this.daysOfWeek,
    this.dayOfMonth,
    this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'interval': interval,
      'daysOfWeek': daysOfWeek,
      'dayOfMonth': dayOfMonth,
      'endDate': endDate?.toIso8601String(),
    };
  }

  factory RecurrencePattern.fromJson(Map<String, dynamic> json) {
    return RecurrencePattern(
      type: RecurrenceType.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      interval: json['interval'],
      daysOfWeek: json['daysOfWeek'] != null
          ? List<int>.from(json['daysOfWeek'])
          : null,
      dayOfMonth: json['dayOfMonth'],
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
    );
  }
}

enum RecurrenceType { daily, weekly, monthly, yearly }
