import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final int id;
  final String title;
  final String subtitle;
  final String status;
  final String color;

  @JsonKey(defaultValue: 0)
  final int progress;

  @JsonKey(name: 'tasks_count', defaultValue: 0)
  final int tasksCount;

  @JsonKey(name: 'completed_tasks', defaultValue: 0)
  final int completedTasks;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
    required this.progress,
    required this.tasksCount,
    required this.completedTasks,
    required this.createdAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      title: title,
      subtitle: subtitle,
      status: ProjectStatus.fromString(status),
      color: color,
      progress: progress,
      tasksCount: tasksCount,
      completedTasks: completedTasks,
      createdAt: createdAt,
    );
  }
}
