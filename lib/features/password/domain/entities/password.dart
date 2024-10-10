class Password {
  final String id;
  final String title;
  final String username;
  final String password;
  final String? website;
  final String? notes;

  Password({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
    this.website,
    this.notes,
  });

  Password copyWith({
    String? id,
    String? title,
    String? username,
    String? password,
    String? website,
    String? notes,
  }) {
    return Password(
      id: id ?? this.id,
      title: title ?? this.title,
      username: username ?? this.username,
      password: password ?? this.password,
      website: website ?? this.website,
      notes: notes ?? this.notes,
    );
  }
}