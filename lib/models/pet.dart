class Pet {
  final String id;
  final String name;
  final String species;
  final String breed;
  final DateTime birthDate;
  final double weight;
  final String? photoUrl;
  final List<CareRecord> careRecords;

  Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.birthDate,
    required this.weight,
    this.photoUrl,
    this.careRecords = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'birthDate': birthDate.toIso8601String(),
      'weight': weight,
      'photoUrl': photoUrl,
      'careRecords': careRecords.map((record) => record.toJson()).toList(),
    };
  }

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      breed: json['breed'],
      birthDate: DateTime.parse(json['birthDate']),
      weight: json['weight'].toDouble(),
      photoUrl: json['photoUrl'],
      careRecords: (json['careRecords'] as List?)
              ?.map((record) => CareRecord.fromJson(record as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Pet copyWith({
    String? id,
    String? name,
    String? species,
    String? breed,
    DateTime? birthDate,
    double? weight,
    String? photoUrl,
    List<CareRecord>? careRecords,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      birthDate: birthDate ?? this.birthDate,
      weight: weight ?? this.weight,
      photoUrl: photoUrl ?? this.photoUrl,
      careRecords: careRecords ?? this.careRecords,
    );
  }
}

class CareRecord {
  final String id;
  final String petId;
  final CareType type;
  final DateTime date;
  final String description;
  final DateTime? nextDueDate;
  final String? notes;

  CareRecord({
    required this.id,
    required this.petId,
    required this.type,
    required this.date,
    required this.description,
    this.nextDueDate,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'petId': petId,
      'type': type.toString().split('.').last,
      'date': date.toIso8601String(),
      'description': description,
      'nextDueDate': nextDueDate?.toIso8601String(),
      'notes': notes,
    };
  }

  factory CareRecord.fromJson(Map<String, dynamic> json) {
    return CareRecord(
      id: json['id'],
      petId: json['petId'],
      type: CareType.values.firstWhere(
          (e) => e.toString().split('.').last == json['type']),
      date: DateTime.parse(json['date']),
      description: json['description'],
      nextDueDate: json['nextDueDate'] != null
          ? DateTime.parse(json['nextDueDate'])
          : null,
      notes: json['notes'],
    );
  }
}

enum CareType {
  feeding,
  healthCheck,
  vaccination,
  grooming,
  exercise,
  medication,
  other
}
