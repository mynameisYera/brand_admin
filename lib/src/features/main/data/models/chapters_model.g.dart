// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChaptersModelImpl _$$ChaptersModelImplFromJson(Map<String, dynamic> json) =>
    _$ChaptersModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$$ChaptersModelImplToJson(_$ChaptersModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
    };
