import 'package:json_annotation/json_annotation.dart';
import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final int id;
  final String title;
  final String description;
  final String status;
  final String color;
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.color,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      title: title,
      description: description,
      status: status,
      color: color,
      isArchived: isArchived,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
