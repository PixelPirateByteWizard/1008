import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_data.freezed.dart';
part 'note_data.g.dart';

@freezed
class NoteData with _$NoteData {
  const factory NoteData({
    required String id,
    required String title,
    required double amount,
    required DateTime date,
    required String category,
    String? note,
    String? photoUrl,
  }) = _NoteData;

  factory NoteData.fromJson(Map<String, dynamic> json) =>
      _$NoteDataFromJson(json);
}
