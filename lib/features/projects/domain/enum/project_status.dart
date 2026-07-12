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
}
