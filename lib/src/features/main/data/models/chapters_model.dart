import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/base/base_models/base_entity.dart';

part 'chapters_model.freezed.dart';
part 'chapters_model.g.dart';

@freezed
class ChaptersModel extends BaseEntity with _$ChaptersModel {
  const factory ChaptersModel({
    required int id,
    required String name,
    required int number,
  }) = _ChaptersModel;

  factory ChaptersModel.fromJson(Map<String, dynamic> json) =>
      _$ChaptersModelFromJson(json);
}
