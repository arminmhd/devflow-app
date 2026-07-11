class ProjectEntity {
  final int id;
  final String title;
  final String description;
  final String status;
  final String color;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.color,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
}
