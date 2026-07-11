import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.status,
    required super.color,
    required super.isArchived,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? 0,
      title: json['title'],
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      color: json['color'] ?? '#000000',
      isArchived: json['is_archived'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "status": status,
      "color": color,
      "is_archived": isArchived,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}
