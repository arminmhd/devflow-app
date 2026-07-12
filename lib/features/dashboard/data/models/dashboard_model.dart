import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/dashboard_entity.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  @JsonKey(name: 'projects_count')
  final int projectsCount;

  @JsonKey(name: 'tasks_count')
  final int tasksCount;

  @JsonKey(name: 'completed_tasks')
  final int completedTasks;

  @JsonKey(name: 'today_tasks')
  final int todayTasks;

  @JsonKey(name: 'time_today_minutes')
  final int timeTodayMinutes;

  @JsonKey(name: 'income_this_month')
  final double incomeThisMonth;

  @JsonKey(name: 'notes_count')
  final int notesCount;

  const DashboardModel({
    required this.projectsCount,
    required this.tasksCount,
    required this.completedTasks,
    required this.todayTasks,
    required this.timeTodayMinutes,
    required this.incomeThisMonth,
    required this.notesCount,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  DashboardEntity toEntity() {
    return DashboardEntity(
      projectsCount: projectsCount,
      tasksCount: tasksCount,
      completedTasks: completedTasks,
      todayTasks: todayTasks,
      timeTodayMinutes: timeTodayMinutes,
      incomeThisMonth: incomeThisMonth,
      notesCount: notesCount,
    );
  }
}
