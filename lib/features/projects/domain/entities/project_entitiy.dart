import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final ProjectStatus status;
  final String color;

  final DateTime createdAt;
  final DateTime updatedAt;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    status,
    color,
    createdAt,
    updatedAt,
  ];
}
