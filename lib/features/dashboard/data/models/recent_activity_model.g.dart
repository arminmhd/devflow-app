// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentActivityModel _$RecentActivityModelFromJson(Map<String, dynamic> json) =>
    RecentActivityModel(
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$RecentActivityModelToJson(
  RecentActivityModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'description': instance.description,
  'timestamp': instance.timestamp,
};
