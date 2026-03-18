// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsModelImpl _$$LessonsModelImplFromJson(Map<String, dynamic> json) =>
    _$LessonsModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$$LessonsModelImplToJson(_$LessonsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'number': instance.number,
    };
