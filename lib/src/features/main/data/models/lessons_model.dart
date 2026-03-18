import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/base/base_models/base_entity.dart';

part 'lessons_model.freezed.dart';
part 'lessons_model.g.dart';

@freezed
class LessonsModel extends BaseEntity with _$LessonsModel {
  const factory LessonsModel({
    required int id,
    required String title,
    required int number,
  }) = _LessonsModel;

  factory LessonsModel.fromJson(Map<String, dynamic> json) =>
      _$LessonsModelFromJson(json);
}
