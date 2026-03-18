// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_id')
  int get lessonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_type')
  String get taskType => throw _privateConstructorUsedError;
  int get group => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_solution_url')
  String? get videoSolutionUrl => throw _privateConstructorUsedError;
  int get state => throw _privateConstructorUsedError;
  List<ChoiceModel> get choices => throw _privateConstructorUsedError;
  @JsonKey(name: 'matching_pairs')
  MatchingPairsModel? get matchingPairs => throw _privateConstructorUsedError;
  AnswerModel? get answer => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'lesson_id') int lessonId,
    @JsonKey(name: 'task_type') String taskType,
    int group,
    String content,
    int? number,
    @JsonKey(name: 'video_solution_url') String? videoSolutionUrl,
    int state,
    List<ChoiceModel> choices,
    @JsonKey(name: 'matching_pairs') MatchingPairsModel? matchingPairs,
    AnswerModel? answer,
  });

  $MatchingPairsModelCopyWith<$Res>? get matchingPairs;
  $AnswerModelCopyWith<$Res>? get answer;
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lessonId = null,
    Object? taskType = null,
    Object? group = null,
    Object? content = null,
    Object? number = freezed,
    Object? videoSolutionUrl = freezed,
    Object? state = null,
    Object? choices = null,
    Object? matchingPairs = freezed,
    Object? answer = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            lessonId: null == lessonId
                ? _value.lessonId
                : lessonId // ignore: cast_nullable_to_non_nullable
                      as int,
            taskType: null == taskType
                ? _value.taskType
                : taskType // ignore: cast_nullable_to_non_nullable
                      as String,
            group: null == group
                ? _value.group
                : group // ignore: cast_nullable_to_non_nullable
                      as int,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            number: freezed == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int?,
            videoSolutionUrl: freezed == videoSolutionUrl
                ? _value.videoSolutionUrl
                : videoSolutionUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as int,
            choices: null == choices
                ? _value.choices
                : choices // ignore: cast_nullable_to_non_nullable
                      as List<ChoiceModel>,
            matchingPairs: freezed == matchingPairs
                ? _value.matchingPairs
                : matchingPairs // ignore: cast_nullable_to_non_nullable
                      as MatchingPairsModel?,
            answer: freezed == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as AnswerModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchingPairsModelCopyWith<$Res>? get matchingPairs {
    if (_value.matchingPairs == null) {
      return null;
    }

    return $MatchingPairsModelCopyWith<$Res>(_value.matchingPairs!, (value) {
      return _then(_value.copyWith(matchingPairs: value) as $Val);
    });
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerModelCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $AnswerModelCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
    _$TaskModelImpl value,
    $Res Function(_$TaskModelImpl) then,
  ) = __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'lesson_id') int lessonId,
    @JsonKey(name: 'task_type') String taskType,
    int group,
    String content,
    int? number,
    @JsonKey(name: 'video_solution_url') String? videoSolutionUrl,
    int state,
    List<ChoiceModel> choices,
    @JsonKey(name: 'matching_pairs') MatchingPairsModel? matchingPairs,
    AnswerModel? answer,
  });

  @override
  $MatchingPairsModelCopyWith<$Res>? get matchingPairs;
  @override
  $AnswerModelCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
    _$TaskModelImpl _value,
    $Res Function(_$TaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lessonId = null,
    Object? taskType = null,
    Object? group = null,
    Object? content = null,
    Object? number = freezed,
    Object? videoSolutionUrl = freezed,
    Object? state = null,
    Object? choices = null,
    Object? matchingPairs = freezed,
    Object? answer = freezed,
  }) {
    return _then(
      _$TaskModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        lessonId: null == lessonId
            ? _value.lessonId
            : lessonId // ignore: cast_nullable_to_non_nullable
                  as int,
        taskType: null == taskType
            ? _value.taskType
            : taskType // ignore: cast_nullable_to_non_nullable
                  as String,
        group: null == group
            ? _value.group
            : group // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        number: freezed == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int?,
        videoSolutionUrl: freezed == videoSolutionUrl
            ? _value.videoSolutionUrl
            : videoSolutionUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as int,
        choices: null == choices
            ? _value._choices
            : choices // ignore: cast_nullable_to_non_nullable
                  as List<ChoiceModel>,
        matchingPairs: freezed == matchingPairs
            ? _value.matchingPairs
            : matchingPairs // ignore: cast_nullable_to_non_nullable
                  as MatchingPairsModel?,
        answer: freezed == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as AnswerModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl({
    required this.id,
    @JsonKey(name: 'lesson_id') required this.lessonId,
    @JsonKey(name: 'task_type') required this.taskType,
    required this.group,
    required this.content,
    this.number,
    @JsonKey(name: 'video_solution_url') this.videoSolutionUrl,
    required this.state,
    required final List<ChoiceModel> choices,
    @JsonKey(name: 'matching_pairs') this.matchingPairs,
    this.answer,
  }) : _choices = choices;

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'lesson_id')
  final int lessonId;
  @override
  @JsonKey(name: 'task_type')
  final String taskType;
  @override
  final int group;
  @override
  final String content;
  @override
  final int? number;
  @override
  @JsonKey(name: 'video_solution_url')
  final String? videoSolutionUrl;
  @override
  final int state;
  final List<ChoiceModel> _choices;
  @override
  List<ChoiceModel> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  @JsonKey(name: 'matching_pairs')
  final MatchingPairsModel? matchingPairs;
  @override
  final AnswerModel? answer;

  @override
  String toString() {
    return 'TaskModel(id: $id, lessonId: $lessonId, taskType: $taskType, group: $group, content: $content, number: $number, videoSolutionUrl: $videoSolutionUrl, state: $state, choices: $choices, matchingPairs: $matchingPairs, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.videoSolutionUrl, videoSolutionUrl) ||
                other.videoSolutionUrl == videoSolutionUrl) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.matchingPairs, matchingPairs) ||
                other.matchingPairs == matchingPairs) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    lessonId,
    taskType,
    group,
    content,
    number,
    videoSolutionUrl,
    state,
    const DeepCollectionEquality().hash(_choices),
    matchingPairs,
    answer,
  );

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(this);
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel({
    required final int id,
    @JsonKey(name: 'lesson_id') required final int lessonId,
    @JsonKey(name: 'task_type') required final String taskType,
    required final int group,
    required final String content,
    final int? number,
    @JsonKey(name: 'video_solution_url') final String? videoSolutionUrl,
    required final int state,
    required final List<ChoiceModel> choices,
    @JsonKey(name: 'matching_pairs') final MatchingPairsModel? matchingPairs,
    final AnswerModel? answer,
  }) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'lesson_id')
  int get lessonId;
  @override
  @JsonKey(name: 'task_type')
  String get taskType;
  @override
  int get group;
  @override
  String get content;
  @override
  int? get number;
  @override
  @JsonKey(name: 'video_solution_url')
  String? get videoSolutionUrl;
  @override
  int get state;
  @override
  List<ChoiceModel> get choices;
  @override
  @JsonKey(name: 'matching_pairs')
  MatchingPairsModel? get matchingPairs;
  @override
  AnswerModel? get answer;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChoiceModel _$ChoiceModelFromJson(Map<String, dynamic> json) {
  return _ChoiceModel.fromJson(json);
}

/// @nodoc
mixin _$ChoiceModel {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this ChoiceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChoiceModelCopyWith<ChoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceModelCopyWith<$Res> {
  factory $ChoiceModelCopyWith(
    ChoiceModel value,
    $Res Function(ChoiceModel) then,
  ) = _$ChoiceModelCopyWithImpl<$Res, ChoiceModel>;
  @useResult
  $Res call({
    int id,
    String content,
    @JsonKey(name: 'is_correct') bool isCorrect,
  });
}

/// @nodoc
class _$ChoiceModelCopyWithImpl<$Res, $Val extends ChoiceModel>
    implements $ChoiceModelCopyWith<$Res> {
  _$ChoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isCorrect = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            isCorrect: null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChoiceModelImplCopyWith<$Res>
    implements $ChoiceModelCopyWith<$Res> {
  factory _$$ChoiceModelImplCopyWith(
    _$ChoiceModelImpl value,
    $Res Function(_$ChoiceModelImpl) then,
  ) = __$$ChoiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String content,
    @JsonKey(name: 'is_correct') bool isCorrect,
  });
}

/// @nodoc
class __$$ChoiceModelImplCopyWithImpl<$Res>
    extends _$ChoiceModelCopyWithImpl<$Res, _$ChoiceModelImpl>
    implements _$$ChoiceModelImplCopyWith<$Res> {
  __$$ChoiceModelImplCopyWithImpl(
    _$ChoiceModelImpl _value,
    $Res Function(_$ChoiceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isCorrect = null,
  }) {
    return _then(
      _$ChoiceModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        isCorrect: null == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoiceModelImpl implements _ChoiceModel {
  const _$ChoiceModelImpl({
    required this.id,
    required this.content,
    @JsonKey(name: 'is_correct') required this.isCorrect,
  });

  factory _$ChoiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoiceModelImplFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;

  @override
  String toString() {
    return 'ChoiceModel(id: $id, content: $content, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, isCorrect);

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceModelImplCopyWith<_$ChoiceModelImpl> get copyWith =>
      __$$ChoiceModelImplCopyWithImpl<_$ChoiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoiceModelImplToJson(this);
  }
}

abstract class _ChoiceModel implements ChoiceModel {
  const factory _ChoiceModel({
    required final int id,
    required final String content,
    @JsonKey(name: 'is_correct') required final bool isCorrect,
  }) = _$ChoiceModelImpl;

  factory _ChoiceModel.fromJson(Map<String, dynamic> json) =
      _$ChoiceModelImpl.fromJson;

  @override
  int get id;
  @override
  String get content;
  @override
  @JsonKey(name: 'is_correct')
  bool get isCorrect;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChoiceModelImplCopyWith<_$ChoiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchingPairsModel _$MatchingPairsModelFromJson(Map<String, dynamic> json) {
  return _MatchingPairsModel.fromJson(json);
}

/// @nodoc
mixin _$MatchingPairsModel {
  @JsonKey(name: 'left_items')
  List<MatchingItemModel> get leftItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'right_items')
  List<MatchingItemModel> get rightItems => throw _privateConstructorUsedError;

  /// Serializes this MatchingPairsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingPairsModelCopyWith<MatchingPairsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingPairsModelCopyWith<$Res> {
  factory $MatchingPairsModelCopyWith(
    MatchingPairsModel value,
    $Res Function(MatchingPairsModel) then,
  ) = _$MatchingPairsModelCopyWithImpl<$Res, MatchingPairsModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'left_items') List<MatchingItemModel> leftItems,
    @JsonKey(name: 'right_items') List<MatchingItemModel> rightItems,
  });
}

/// @nodoc
class _$MatchingPairsModelCopyWithImpl<$Res, $Val extends MatchingPairsModel>
    implements $MatchingPairsModelCopyWith<$Res> {
  _$MatchingPairsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? leftItems = null, Object? rightItems = null}) {
    return _then(
      _value.copyWith(
            leftItems: null == leftItems
                ? _value.leftItems
                : leftItems // ignore: cast_nullable_to_non_nullable
                      as List<MatchingItemModel>,
            rightItems: null == rightItems
                ? _value.rightItems
                : rightItems // ignore: cast_nullable_to_non_nullable
                      as List<MatchingItemModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchingPairsModelImplCopyWith<$Res>
    implements $MatchingPairsModelCopyWith<$Res> {
  factory _$$MatchingPairsModelImplCopyWith(
    _$MatchingPairsModelImpl value,
    $Res Function(_$MatchingPairsModelImpl) then,
  ) = __$$MatchingPairsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'left_items') List<MatchingItemModel> leftItems,
    @JsonKey(name: 'right_items') List<MatchingItemModel> rightItems,
  });
}

/// @nodoc
class __$$MatchingPairsModelImplCopyWithImpl<$Res>
    extends _$MatchingPairsModelCopyWithImpl<$Res, _$MatchingPairsModelImpl>
    implements _$$MatchingPairsModelImplCopyWith<$Res> {
  __$$MatchingPairsModelImplCopyWithImpl(
    _$MatchingPairsModelImpl _value,
    $Res Function(_$MatchingPairsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchingPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? leftItems = null, Object? rightItems = null}) {
    return _then(
      _$MatchingPairsModelImpl(
        leftItems: null == leftItems
            ? _value._leftItems
            : leftItems // ignore: cast_nullable_to_non_nullable
                  as List<MatchingItemModel>,
        rightItems: null == rightItems
            ? _value._rightItems
            : rightItems // ignore: cast_nullable_to_non_nullable
                  as List<MatchingItemModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingPairsModelImpl implements _MatchingPairsModel {
  const _$MatchingPairsModelImpl({
    @JsonKey(name: 'left_items')
    required final List<MatchingItemModel> leftItems,
    @JsonKey(name: 'right_items')
    required final List<MatchingItemModel> rightItems,
  }) : _leftItems = leftItems,
       _rightItems = rightItems;

  factory _$MatchingPairsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingPairsModelImplFromJson(json);

  final List<MatchingItemModel> _leftItems;
  @override
  @JsonKey(name: 'left_items')
  List<MatchingItemModel> get leftItems {
    if (_leftItems is EqualUnmodifiableListView) return _leftItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leftItems);
  }

  final List<MatchingItemModel> _rightItems;
  @override
  @JsonKey(name: 'right_items')
  List<MatchingItemModel> get rightItems {
    if (_rightItems is EqualUnmodifiableListView) return _rightItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rightItems);
  }

  @override
  String toString() {
    return 'MatchingPairsModel(leftItems: $leftItems, rightItems: $rightItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingPairsModelImpl &&
            const DeepCollectionEquality().equals(
              other._leftItems,
              _leftItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._rightItems,
              _rightItems,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_leftItems),
    const DeepCollectionEquality().hash(_rightItems),
  );

  /// Create a copy of MatchingPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingPairsModelImplCopyWith<_$MatchingPairsModelImpl> get copyWith =>
      __$$MatchingPairsModelImplCopyWithImpl<_$MatchingPairsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingPairsModelImplToJson(this);
  }
}

abstract class _MatchingPairsModel implements MatchingPairsModel {
  const factory _MatchingPairsModel({
    @JsonKey(name: 'left_items')
    required final List<MatchingItemModel> leftItems,
    @JsonKey(name: 'right_items')
    required final List<MatchingItemModel> rightItems,
  }) = _$MatchingPairsModelImpl;

  factory _MatchingPairsModel.fromJson(Map<String, dynamic> json) =
      _$MatchingPairsModelImpl.fromJson;

  @override
  @JsonKey(name: 'left_items')
  List<MatchingItemModel> get leftItems;
  @override
  @JsonKey(name: 'right_items')
  List<MatchingItemModel> get rightItems;

  /// Create a copy of MatchingPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingPairsModelImplCopyWith<_$MatchingPairsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchingItemModel _$MatchingItemModelFromJson(Map<String, dynamic> json) {
  return _MatchingItemModel.fromJson(json);
}

/// @nodoc
mixin _$MatchingItemModel {
  @JsonKey(name: 'left_id')
  int? get leftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'right_id')
  int? get rightId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this MatchingItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingItemModelCopyWith<MatchingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingItemModelCopyWith<$Res> {
  factory $MatchingItemModelCopyWith(
    MatchingItemModel value,
    $Res Function(MatchingItemModel) then,
  ) = _$MatchingItemModelCopyWithImpl<$Res, MatchingItemModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'left_id') int? leftId,
    @JsonKey(name: 'right_id') int? rightId,
    String content,
  });
}

/// @nodoc
class _$MatchingItemModelCopyWithImpl<$Res, $Val extends MatchingItemModel>
    implements $MatchingItemModelCopyWith<$Res> {
  _$MatchingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftId = freezed,
    Object? rightId = freezed,
    Object? content = null,
  }) {
    return _then(
      _value.copyWith(
            leftId: freezed == leftId
                ? _value.leftId
                : leftId // ignore: cast_nullable_to_non_nullable
                      as int?,
            rightId: freezed == rightId
                ? _value.rightId
                : rightId // ignore: cast_nullable_to_non_nullable
                      as int?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchingItemModelImplCopyWith<$Res>
    implements $MatchingItemModelCopyWith<$Res> {
  factory _$$MatchingItemModelImplCopyWith(
    _$MatchingItemModelImpl value,
    $Res Function(_$MatchingItemModelImpl) then,
  ) = __$$MatchingItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'left_id') int? leftId,
    @JsonKey(name: 'right_id') int? rightId,
    String content,
  });
}

/// @nodoc
class __$$MatchingItemModelImplCopyWithImpl<$Res>
    extends _$MatchingItemModelCopyWithImpl<$Res, _$MatchingItemModelImpl>
    implements _$$MatchingItemModelImplCopyWith<$Res> {
  __$$MatchingItemModelImplCopyWithImpl(
    _$MatchingItemModelImpl _value,
    $Res Function(_$MatchingItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftId = freezed,
    Object? rightId = freezed,
    Object? content = null,
  }) {
    return _then(
      _$MatchingItemModelImpl(
        leftId: freezed == leftId
            ? _value.leftId
            : leftId // ignore: cast_nullable_to_non_nullable
                  as int?,
        rightId: freezed == rightId
            ? _value.rightId
            : rightId // ignore: cast_nullable_to_non_nullable
                  as int?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingItemModelImpl implements _MatchingItemModel {
  const _$MatchingItemModelImpl({
    @JsonKey(name: 'left_id') this.leftId,
    @JsonKey(name: 'right_id') this.rightId,
    required this.content,
  });

  factory _$MatchingItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'left_id')
  final int? leftId;
  @override
  @JsonKey(name: 'right_id')
  final int? rightId;
  @override
  final String content;

  @override
  String toString() {
    return 'MatchingItemModel(leftId: $leftId, rightId: $rightId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingItemModelImpl &&
            (identical(other.leftId, leftId) || other.leftId == leftId) &&
            (identical(other.rightId, rightId) || other.rightId == rightId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, leftId, rightId, content);

  /// Create a copy of MatchingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingItemModelImplCopyWith<_$MatchingItemModelImpl> get copyWith =>
      __$$MatchingItemModelImplCopyWithImpl<_$MatchingItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingItemModelImplToJson(this);
  }
}

abstract class _MatchingItemModel implements MatchingItemModel {
  const factory _MatchingItemModel({
    @JsonKey(name: 'left_id') final int? leftId,
    @JsonKey(name: 'right_id') final int? rightId,
    required final String content,
  }) = _$MatchingItemModelImpl;

  factory _MatchingItemModel.fromJson(Map<String, dynamic> json) =
      _$MatchingItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'left_id')
  int? get leftId;
  @override
  @JsonKey(name: 'right_id')
  int? get rightId;
  @override
  String get content;

  /// Create a copy of MatchingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingItemModelImplCopyWith<_$MatchingItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String get correctAnswer => throw _privateConstructorUsedError;

  /// Serializes this AnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
    AnswerModel value,
    $Res Function(AnswerModel) then,
  ) = _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call({int id, @JsonKey(name: 'correct_answer') String correctAnswer});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? correctAnswer = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            correctAnswer: null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnswerModelImplCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$AnswerModelImplCopyWith(
    _$AnswerModelImpl value,
    $Res Function(_$AnswerModelImpl) then,
  ) = __$$AnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, @JsonKey(name: 'correct_answer') String correctAnswer});
}

/// @nodoc
class __$$AnswerModelImplCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$AnswerModelImpl>
    implements _$$AnswerModelImplCopyWith<$Res> {
  __$$AnswerModelImplCopyWithImpl(
    _$AnswerModelImpl _value,
    $Res Function(_$AnswerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? correctAnswer = null}) {
    return _then(
      _$AnswerModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        correctAnswer: null == correctAnswer
            ? _value.correctAnswer
            : correctAnswer // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerModelImpl implements _AnswerModel {
  const _$AnswerModelImpl({
    required this.id,
    @JsonKey(name: 'correct_answer') required this.correctAnswer,
  });

  factory _$AnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;

  @override
  String toString() {
    return 'AnswerModel(id: $id, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, correctAnswer);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      __$$AnswerModelImplCopyWithImpl<_$AnswerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerModelImplToJson(this);
  }
}

abstract class _AnswerModel implements AnswerModel {
  const factory _AnswerModel({
    required final int id,
    @JsonKey(name: 'correct_answer') required final String correctAnswer,
  }) = _$AnswerModelImpl;

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$AnswerModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'correct_answer')
  String get correctAnswer;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
