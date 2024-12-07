class ShoppingItem {
  final String id;
  final String name;
  final int quantity;
  final String category;
  final String? note;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;

  ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    this.note,
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'category': category,
      'note': note,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      category: json['category'],
      note: json['note'],
      isCompleted: json['isCompleted'],
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
    );
  }

  ShoppingItem copyWith({
    String? id,
    String? name,
    int? quantity,
    String? category,
    String? note,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
