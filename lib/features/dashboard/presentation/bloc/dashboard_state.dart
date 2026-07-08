import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import 'package:equatable/equatable.dart';

enum DashboardStatus { initial, loading, loaded, error }

class DashboardState extends Equatable {
  final DashboardEntity? data;
  final List<RecentActivityEntity>? recentActivity;
  final DashboardStatus status;
  final String? error;

  const DashboardState({
    this.data,
    this.error,
    required this.status,
    this.recentActivity,
  });

  factory DashboardState.initial() {
    return const DashboardState(
      status: DashboardStatus.initial,
      data: null,
      error: null,
      recentActivity: [],
    );
  }

  factory DashboardState.loading() {
    return const DashboardState(
      status: DashboardStatus.loading,
      data: null,
      error: null,
      recentActivity: [],
    );
  }

  factory DashboardState.loaded({
    required DashboardEntity data,
    required List<RecentActivityEntity> recentActivity,
  }) {
    return DashboardState(
      status: DashboardStatus.loaded,
      data: data,
      error: null,
      recentActivity: recentActivity,
    );
  }

  factory DashboardState.error(String message) {
    return DashboardState(
      status: DashboardStatus.error,
      data: null,
      error: message,
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
      error: error ?? this.error,
      recentActivity: recentActivity ?? this.recentActivity,
    );
  }

  @override
  List<Object?> get props => [status, data, error, recentActivity];
}
