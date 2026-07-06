import 'package:devflow/features/home/domain/entities/dashboard_entity.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final DashboardEntity? data;
  final HomeStatus status;
  final String? error;

  const HomeState({this.data, this.error, required this.status});

  factory HomeState.initial() {
    return const HomeState(status: HomeStatus.initial, data: null, error: null);
  }

  factory HomeState.loading() {
    return const HomeState(status: HomeStatus.loading, data: null, error: null);
  }

  factory HomeState.loaded(DashboardEntity data) {
    return HomeState(status: HomeStatus.loaded, data: data);
  }

  factory HomeState.error(String message) {
    return HomeState(status: HomeStatus.error, data: null, error: message);
  }

  HomeState copyWith({
    HomeStatus? status,
    DashboardEntity? data,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, data, error];
}
