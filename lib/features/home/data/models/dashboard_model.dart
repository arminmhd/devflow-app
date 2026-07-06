import '../../domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.projectsCount,
    required super.tasksToday,
    required super.tasksOverdue,
    required super.totalIncome,
    required super.totalTime,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      projectsCount: json['projects_count'] ?? 0,
      tasksToday: json['tasks_today'] ?? 0,
      tasksOverdue: json['tasks_overdue'] ?? 0,
      totalIncome: double.tryParse(json['total_income'].toString()) ?? 0.0,
      totalTime: json['total_time'] ?? 0,
    );
  }
}
