// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LessonsModel _$LessonsModelFromJson(Map<String, dynamic> json) {
  return _LessonsModel.fromJson(json);
}

/// @nodoc
mixin _$LessonsModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  /// Serializes this LessonsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonsModelCopyWith<LessonsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsModelCopyWith<$Res> {
  factory $LessonsModelCopyWith(
    LessonsModel value,
    $Res Function(LessonsModel) then,
  ) = _$LessonsModelCopyWithImpl<$Res, LessonsModel>;
  @useResult
  $Res call({int id, String title, int number});
}

/// @nodoc
class _$LessonsModelCopyWithImpl<$Res, $Val extends LessonsModel>
    implements $LessonsModelCopyWith<$Res> {
  _$LessonsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? title = null, Object? number = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LessonsModelImplCopyWith<$Res>
    implements $LessonsModelCopyWith<$Res> {
  factory _$$LessonsModelImplCopyWith(
    _$LessonsModelImpl value,
    $Res Function(_$LessonsModelImpl) then,
  ) = __$$LessonsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, int number});
}

/// @nodoc
class __$$LessonsModelImplCopyWithImpl<$Res>
    extends _$LessonsModelCopyWithImpl<$Res, _$LessonsModelImpl>
    implements _$$LessonsModelImplCopyWith<$Res> {
  __$$LessonsModelImplCopyWithImpl(
    _$LessonsModelImpl _value,
    $Res Function(_$LessonsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? title = null, Object? number = null}) {
    return _then(
      _$LessonsModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonsModelImpl implements _LessonsModel {
  const _$LessonsModelImpl({
    required this.id,
    required this.title,
    required this.number,
  });

  factory _$LessonsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonsModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int number;

  @override
  String toString() {
    return 'LessonsModel(id: $id, title: $title, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, number);

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsModelImplCopyWith<_$LessonsModelImpl> get copyWith =>
      __$$LessonsModelImplCopyWithImpl<_$LessonsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonsModelImplToJson(this);
  }
}

abstract class _LessonsModel implements LessonsModel {
  const factory _LessonsModel({
    required final int id,
    required final String title,
    required final int number,
  }) = _$LessonsModelImpl;

  factory _LessonsModel.fromJson(Map<String, dynamic> json) =
      _$LessonsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  int get number;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsModelImplCopyWith<_$LessonsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
