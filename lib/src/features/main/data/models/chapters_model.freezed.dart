// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChaptersModel _$ChaptersModelFromJson(Map<String, dynamic> json) {
  return _ChaptersModel.fromJson(json);
}

/// @nodoc
mixin _$ChaptersModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  /// Serializes this ChaptersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChaptersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChaptersModelCopyWith<ChaptersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaptersModelCopyWith<$Res> {
  factory $ChaptersModelCopyWith(
    ChaptersModel value,
    $Res Function(ChaptersModel) then,
  ) = _$ChaptersModelCopyWithImpl<$Res, ChaptersModel>;
  @useResult
  $Res call({int id, String name, int number});
}

/// @nodoc
class _$ChaptersModelCopyWithImpl<$Res, $Val extends ChaptersModel>
    implements $ChaptersModelCopyWith<$Res> {
  _$ChaptersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaptersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? number = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ChaptersModelImplCopyWith<$Res>
    implements $ChaptersModelCopyWith<$Res> {
  factory _$$ChaptersModelImplCopyWith(
    _$ChaptersModelImpl value,
    $Res Function(_$ChaptersModelImpl) then,
  ) = __$$ChaptersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int number});
}

/// @nodoc
class __$$ChaptersModelImplCopyWithImpl<$Res>
    extends _$ChaptersModelCopyWithImpl<$Res, _$ChaptersModelImpl>
    implements _$$ChaptersModelImplCopyWith<$Res> {
  __$$ChaptersModelImplCopyWithImpl(
    _$ChaptersModelImpl _value,
    $Res Function(_$ChaptersModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChaptersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? number = null}) {
    return _then(
      _$ChaptersModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
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
class _$ChaptersModelImpl implements _ChaptersModel {
  const _$ChaptersModelImpl({
    required this.id,
    required this.name,
    required this.number,
  });

  factory _$ChaptersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaptersModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int number;

  @override
  String toString() {
    return 'ChaptersModel(id: $id, name: $name, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaptersModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, number);

  /// Create a copy of ChaptersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaptersModelImplCopyWith<_$ChaptersModelImpl> get copyWith =>
      __$$ChaptersModelImplCopyWithImpl<_$ChaptersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaptersModelImplToJson(this);
  }
}

abstract class _ChaptersModel implements ChaptersModel {
  const factory _ChaptersModel({
    required final int id,
    required final String name,
    required final int number,
  }) = _$ChaptersModelImpl;

  factory _ChaptersModel.fromJson(Map<String, dynamic> json) =
      _$ChaptersModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get number;

  /// Create a copy of ChaptersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaptersModelImplCopyWith<_$ChaptersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
