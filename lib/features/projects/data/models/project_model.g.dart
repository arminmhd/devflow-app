// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  status: json['status'] as String,
  color: json['color'] as String,
  progress: (json['progress'] as num?)?.toInt() ?? 0,
  tasksCount: (json['tasks_count'] as num?)?.toInt() ?? 0,
  completedTasks: (json['completed_tasks'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'status': instance.status,
      'color': instance.color,
      'progress': instance.progress,
      'tasks_count': instance.tasksCount,
      'completed_tasks': instance.completedTasks,
      'created_at': instance.createdAt.toIso8601String(),
    };
