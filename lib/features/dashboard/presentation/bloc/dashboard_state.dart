import 'package:equatable/equatable.dart';
import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';

enum DashboardStatus { initial, loading, loaded, error }

class DashboardState extends Equatable {
  final DashboardEntity? data;
  final List<RecentActivityEntity> recentActivity;
  final DashboardStatus status;
  final String? error;

  const DashboardState({
    required this.status,
    this.data,
    this.error,
    this.recentActivity = const [],
  });

  factory DashboardState.initial() {
    return const DashboardState(
      status: DashboardStatus.initial,
      data: null,
      error: null,
      recentActivity: [],
    );
  }

  DashboardState copyWith({
    DashboardStatus? status,
    DashboardEntity? data,
    String? error,
    List<RecentActivityEntity>? recentActivity,
  }) {
    return DashboardState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error,
      recentActivity: recentActivity ?? this.recentActivity,
    );
  }

  @override
  List<Object?> get props => [status, data, error, recentActivity];
}
