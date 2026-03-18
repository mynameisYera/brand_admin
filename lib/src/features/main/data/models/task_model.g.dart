// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: (json['id'] as num).toInt(),
      lessonId: (json['lesson_id'] as num).toInt(),
      taskType: json['task_type'] as String,
      group: (json['group'] as num).toInt(),
      content: json['content'] as String,
      number: (json['number'] as num?)?.toInt(),
      videoSolutionUrl: json['video_solution_url'] as String?,
      state: (json['state'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchingPairs: json['matching_pairs'] == null
          ? null
          : MatchingPairsModel.fromJson(
              json['matching_pairs'] as Map<String, dynamic>,
            ),
      answer: json['answer'] == null
          ? null
          : AnswerModel.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lesson_id': instance.lessonId,
      'task_type': instance.taskType,
      'group': instance.group,
      'content': instance.content,
      'number': instance.number,
      'video_solution_url': instance.videoSolutionUrl,
      'state': instance.state,
      'choices': instance.choices,
      'matching_pairs': instance.matchingPairs,
      'answer': instance.answer,
    };

_$ChoiceModelImpl _$$ChoiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ChoiceModelImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$$ChoiceModelImplToJson(_$ChoiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'is_correct': instance.isCorrect,
    };

_$MatchingPairsModelImpl _$$MatchingPairsModelImplFromJson(
  Map<String, dynamic> json,
) => _$MatchingPairsModelImpl(
  leftItems: (json['left_items'] as List<dynamic>)
      .map((e) => MatchingItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  rightItems: (json['right_items'] as List<dynamic>)
      .map((e) => MatchingItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$MatchingPairsModelImplToJson(
  _$MatchingPairsModelImpl instance,
) => <String, dynamic>{
  'left_items': instance.leftItems,
  'right_items': instance.rightItems,
};

_$MatchingItemModelImpl _$$MatchingItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$MatchingItemModelImpl(
  leftId: (json['left_id'] as num?)?.toInt(),
  rightId: (json['right_id'] as num?)?.toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$$MatchingItemModelImplToJson(
  _$MatchingItemModelImpl instance,
) => <String, dynamic>{
  'left_id': instance.leftId,
  'right_id': instance.rightId,
  'content': instance.content,
};

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      id: (json['id'] as num).toInt(),
      correctAnswer: json['correct_answer'] as String,
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct_answer': instance.correctAnswer,
    };
