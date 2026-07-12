// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      projectsCount: (json['projects_count'] as num).toInt(),
      tasksCount: (json['tasks_count'] as num).toInt(),
      completedTasks: (json['completed_tasks'] as num).toInt(),
      todayTasks: (json['today_tasks'] as num).toInt(),
      timeTodayMinutes: (json['time_today_minutes'] as num).toInt(),
      incomeThisMonth: (json['income_this_month'] as num).toDouble(),
      notesCount: (json['notes_count'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'projects_count': instance.projectsCount,
      'tasks_count': instance.tasksCount,
      'completed_tasks': instance.completedTasks,
      'today_tasks': instance.todayTasks,
      'time_today_minutes': instance.timeTodayMinutes,
      'income_this_month': instance.incomeThisMonth,
      'notes_count': instance.notesCount,
    };
