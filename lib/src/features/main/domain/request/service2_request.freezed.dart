// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service2_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Service2Request _$Service2RequestFromJson(Map<String, dynamic> json) {
  return _Service2Request.fromJson(json);
}

/// @nodoc
mixin _$Service2Request {
  @JsonKey(name: 'lesson_id')
  int get lessonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int get groupId => throw _privateConstructorUsedError;

  /// Serializes this Service2Request to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Service2Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Service2RequestCopyWith<Service2Request> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Service2RequestCopyWith<$Res> {
  factory $Service2RequestCopyWith(
    Service2Request value,
    $Res Function(Service2Request) then,
  ) = _$Service2RequestCopyWithImpl<$Res, Service2Request>;
  @useResult
  $Res call({
    @JsonKey(name: 'lesson_id') int lessonId,
    @JsonKey(name: 'group_id') int groupId,
  });
}

/// @nodoc
class _$Service2RequestCopyWithImpl<$Res, $Val extends Service2Request>
    implements $Service2RequestCopyWith<$Res> {
  _$Service2RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Service2Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lessonId = null, Object? groupId = null}) {
    return _then(
      _value.copyWith(
            lessonId: null == lessonId
                ? _value.lessonId
                : lessonId // ignore: cast_nullable_to_non_nullable
                      as int,
            groupId: null == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Service2RequestImplCopyWith<$Res>
    implements $Service2RequestCopyWith<$Res> {
  factory _$$Service2RequestImplCopyWith(
    _$Service2RequestImpl value,
    $Res Function(_$Service2RequestImpl) then,
  ) = __$$Service2RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'lesson_id') int lessonId,
    @JsonKey(name: 'group_id') int groupId,
  });
}

/// @nodoc
class __$$Service2RequestImplCopyWithImpl<$Res>
    extends _$Service2RequestCopyWithImpl<$Res, _$Service2RequestImpl>
    implements _$$Service2RequestImplCopyWith<$Res> {
  __$$Service2RequestImplCopyWithImpl(
    _$Service2RequestImpl _value,
    $Res Function(_$Service2RequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Service2Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lessonId = null, Object? groupId = null}) {
    return _then(
      _$Service2RequestImpl(
        lessonId: null == lessonId
            ? _value.lessonId
            : lessonId // ignore: cast_nullable_to_non_nullable
                  as int,
        groupId: null == groupId
            ? _value.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$Service2RequestImpl implements _Service2Request {
  const _$Service2RequestImpl({
    @JsonKey(name: 'lesson_id') required this.lessonId,
    @JsonKey(name: 'group_id') required this.groupId,
  });

  factory _$Service2RequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$Service2RequestImplFromJson(json);

  @override
  @JsonKey(name: 'lesson_id')
  final int lessonId;
  @override
  @JsonKey(name: 'group_id')
  final int groupId;

  @override
  String toString() {
    return 'Service2Request(lessonId: $lessonId, groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Service2RequestImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lessonId, groupId);

  /// Create a copy of Service2Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Service2RequestImplCopyWith<_$Service2RequestImpl> get copyWith =>
      __$$Service2RequestImplCopyWithImpl<_$Service2RequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$Service2RequestImplToJson(this);
  }
}

abstract class _Service2Request implements Service2Request {
  const factory _Service2Request({
    @JsonKey(name: 'lesson_id') required final int lessonId,
    @JsonKey(name: 'group_id') required final int groupId,
  }) = _$Service2RequestImpl;

  factory _Service2Request.fromJson(Map<String, dynamic> json) =
      _$Service2RequestImpl.fromJson;

  @override
  @JsonKey(name: 'lesson_id')
  int get lessonId;
  @override
  @JsonKey(name: 'group_id')
  int get groupId;

  /// Create a copy of Service2Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Service2RequestImplCopyWith<_$Service2RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
