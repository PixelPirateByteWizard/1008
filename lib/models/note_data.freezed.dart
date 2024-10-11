// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoteData _$NoteDataFromJson(Map<String, dynamic> json) {
  return _NoteData.fromJson(json);
}

/// @nodoc
mixin _$NoteData {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this NoteData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteDataCopyWith<NoteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDataCopyWith<$Res> {
  factory $NoteDataCopyWith(NoteData value, $Res Function(NoteData) then) =
      _$NoteDataCopyWithImpl<$Res, NoteData>;
  @useResult
  $Res call(
      {String id,
      String title,
      double amount,
      DateTime date,
      String category,
      String? note,
      String? photoUrl});
}

/// @nodoc
class _$NoteDataCopyWithImpl<$Res, $Val extends NoteData>
    implements $NoteDataCopyWith<$Res> {
  _$NoteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? date = null,
    Object? category = null,
    Object? note = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteDataImplCopyWith<$Res>
    implements $NoteDataCopyWith<$Res> {
  factory _$$NoteDataImplCopyWith(
          _$NoteDataImpl value, $Res Function(_$NoteDataImpl) then) =
      __$$NoteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      double amount,
      DateTime date,
      String category,
      String? note,
      String? photoUrl});
}

/// @nodoc
class __$$NoteDataImplCopyWithImpl<$Res>
    extends _$NoteDataCopyWithImpl<$Res, _$NoteDataImpl>
    implements _$$NoteDataImplCopyWith<$Res> {
  __$$NoteDataImplCopyWithImpl(
      _$NoteDataImpl _value, $Res Function(_$NoteDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoteData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? date = null,
    Object? category = null,
    Object? note = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$NoteDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteDataImpl implements _NoteData {
  const _$NoteDataImpl(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.category,
      this.note,
      this.photoUrl});

  factory _$NoteDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteDataImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String category;
  @override
  final String? note;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'NoteData(id: $id, title: $title, amount: $amount, date: $date, category: $category, note: $note, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, amount, date, category, note, photoUrl);

  /// Create a copy of NoteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteDataImplCopyWith<_$NoteDataImpl> get copyWith =>
      __$$NoteDataImplCopyWithImpl<_$NoteDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteDataImplToJson(
      this,
    );
  }
}

abstract class _NoteData implements NoteData {
  const factory _NoteData(
      {required final String id,
      required final String title,
      required final double amount,
      required final DateTime date,
      required final String category,
      final String? note,
      final String? photoUrl}) = _$NoteDataImpl;

  factory _NoteData.fromJson(Map<String, dynamic> json) =
      _$NoteDataImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String get category;
  @override
  String? get note;
  @override
  String? get photoUrl;

  /// Create a copy of NoteData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteDataImplCopyWith<_$NoteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
