// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service2_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Service2RequestImpl _$$Service2RequestImplFromJson(
  Map<String, dynamic> json,
) => _$Service2RequestImpl(
  lessonId: (json['lesson_id'] as num).toInt(),
  groupId: (json['group_id'] as num).toInt(),
);

Map<String, dynamic> _$$Service2RequestImplToJson(
  _$Service2RequestImpl instance,
) => <String, dynamic>{
  'lesson_id': instance.lessonId,
  'group_id': instance.groupId,
};
