import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devflow/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:devflow/features/dashboard/domain/usecases/get_recent_activity_usecase.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;
  final GetRecentActivityUseCase getRecentActivityUseCase;

  DashboardBloc({
    required this.getDashboardUseCase,
    required this.getRecentActivityUseCase,
  }) : super(DashboardState.initial()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
    on<LoadRecentActivityEvent>(_onLoadRecentActivity);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    final result = await getDashboardUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: DashboardStatus.error, error: failure.message),
        );
      },
      (entity) {
        emit(state.copyWith(status: DashboardStatus.loaded, data: entity));
      },
    );
  }

  Future<void> _onLoadRecentActivity(
    LoadRecentActivityEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final result = await getRecentActivityUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: DashboardStatus.error, error: failure.message),
        );
      },
      (list) {
        emit(state.copyWith(recentActivity: list));
      },
    );
  }
}
