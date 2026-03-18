// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/base/base_models/base_request.dart';

part 'service2_request.freezed.dart';
part 'service2_request.g.dart';

@freezed
class Service2Request extends BaseRequest with _$Service2Request {
  const factory Service2Request({
    @JsonKey(name: 'lesson_id') required int lessonId,
    @JsonKey(name: 'group_id') required int groupId,
  }) = _Service2Request;

  factory Service2Request.fromJson(Map<String, dynamic> json) =>
      _$Service2RequestFromJson(json);
}