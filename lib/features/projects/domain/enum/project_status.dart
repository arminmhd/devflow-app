enum ProjectStatus {
  active,
  completed,
  archived;

  static ProjectStatus fromString(String value) {
    switch (value) {
      case 'completed':
        return ProjectStatus.completed;

      case 'archived':
        return ProjectStatus.archived;

      case 'active':
      default:
        return ProjectStatus.active;
    }
  }

  String get value {
    switch (this) {
      case ProjectStatus.active:
        return 'active';

      case ProjectStatus.completed:
        return 'completed';

      case ProjectStatus.archived:
        return 'archived';
    }
  }
}
