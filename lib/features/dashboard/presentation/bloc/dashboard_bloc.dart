import 'package:devflow/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:devflow/features/dashboard/domain/usecases/get_recent_activity_usecase.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;
  final GetRecentActivityUseCase getRecentActivityUseCase;

  DashboardBloc({
    required this.getRecentActivityUseCase,
    required this.getDashboardUseCase,
  }) : super(DashboardState.initial()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
    on<LoadRecentActivityEvent>(_onLoadRecentActivity);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardState.loading());

    try {
      final result = await getDashboardUseCase();
      emit(DashboardState.loaded(data: result, recentActivity: []));
    } catch (e) {
      emit(DashboardState.error(e.toString()));
    }
  }

  Future<void> _onLoadRecentActivity(
    LoadRecentActivityEvent event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      final recent = await getRecentActivityUseCase();
      emit(state.copyWith(recentActivity: recent));
    } catch (e) {
      emit(DashboardState.error(e.toString()));
    }
  }
}
