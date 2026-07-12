import 'package:equatable/equatable.dart';

class DashboardEntity extends Equatable {
  final int projectsCount;
  final int tasksCount;
  final int completedTasks;
  final int todayTasks;
  final int timeTodayMinutes;
  final double incomeThisMonth;
  final int notesCount;

  const DashboardEntity({
    required this.projectsCount,
    required this.tasksCount,
    required this.completedTasks,
    required this.todayTasks,
    required this.timeTodayMinutes,
    required this.incomeThisMonth,
    required this.notesCount,
  });

  @override
  List<Object?> get props => [
    projectsCount,
    tasksCount,
    completedTasks,
    todayTasks,
    timeTodayMinutes,
    incomeThisMonth,
    notesCount,
  ];
}
