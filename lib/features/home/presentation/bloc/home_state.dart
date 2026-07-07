import 'package:devflow/features/home/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/home/domain/entities/recent_activity_entity.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final DashboardEntity? data;
  final List<RecentActivityEntity>? recentActivity;
  final HomeStatus status;
  final String? error;

  const HomeState({
    this.data,
    this.error,
    required this.status,
    this.recentActivity,
  });

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStatus.initial,
      data: null,
      error: null,
      recentActivity: [],
    );
  }

  factory HomeState.loading() {
    return const HomeState(
      status: HomeStatus.loading,
      data: null,
      error: null,
      recentActivity: [],
    );
  }

  factory HomeState.loaded({
    required DashboardEntity data,
    required List<RecentActivityEntity> recentActivity,
  }) {
    return HomeState(
      status: HomeStatus.loaded,
      data: data,
      error: null,
      recentActivity: recentActivity,
    );
  }

  factory HomeState.error(String message) {
    return HomeState(
      status: HomeStatus.error,
      data: null,
      error: message,
      recentActivity: [],
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    DashboardEntity? data,
    String? error,
    List<RecentActivityEntity>? recentActivity,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
      recentActivity: recentActivity ?? this.recentActivity,
    );
  }

  @override
  List<Object?> get props => [status, data, error, recentActivity];
}
