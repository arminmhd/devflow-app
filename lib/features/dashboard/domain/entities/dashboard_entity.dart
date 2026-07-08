class DashboardEntity {
  final int projectsCount;
  final int tasksToday;
  final int tasksOverdue;
  final double totalIncome;
  final int totalTime;

  DashboardEntity({
    required this.projectsCount,
    required this.tasksToday,
    required this.tasksOverdue,
    required this.totalIncome,
    required this.totalTime,
  });
}
