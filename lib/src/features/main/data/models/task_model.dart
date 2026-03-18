// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/base/base_models/base_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel extends BaseEntity with _$TaskModel {
  const factory TaskModel({
    required int id,
    @JsonKey(name: 'lesson_id') required int lessonId,
    @JsonKey(name: 'task_type') required String taskType,
    required int group,
    required String content,
    int? number,
    @JsonKey(name: 'video_solution_url') String? videoSolutionUrl,
    required int state,
    required List<ChoiceModel> choices,
    @JsonKey(name: 'matching_pairs') MatchingPairsModel? matchingPairs,
    AnswerModel? answer,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

@freezed
class ChoiceModel with _$ChoiceModel {
  const factory ChoiceModel({
    required int id,
    required String content,
    @JsonKey(name: 'is_correct') required bool isCorrect,
  }) = _ChoiceModel;

  factory ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceModelFromJson(json);
}

@freezed
class MatchingPairsModel with _$MatchingPairsModel {
  const factory MatchingPairsModel({
    @JsonKey(name: 'left_items') required List<MatchingItemModel> leftItems,
    @JsonKey(name: 'right_items') required List<MatchingItemModel> rightItems,
  }) = _MatchingPairsModel;

  factory MatchingPairsModel.fromJson(Map<String, dynamic> json) =>
      _$MatchingPairsModelFromJson(json);
}

@freezed
class MatchingItemModel with _$MatchingItemModel {
  const factory MatchingItemModel({
    @JsonKey(name: 'left_id') int? leftId,
    @JsonKey(name: 'right_id') int? rightId,
    required String content,
  }) = _MatchingItemModel;

  factory MatchingItemModel.fromJson(Map<String, dynamic> json) =>
      _$MatchingItemModelFromJson(json);
}

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required int id,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
