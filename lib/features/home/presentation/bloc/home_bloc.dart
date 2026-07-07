import 'package:devflow/features/home/domain/usecases/get_dashboard_usecase.dart';
import 'package:devflow/features/home/domain/usecases/get_recent_activity_usecase.dart';
import 'package:devflow/features/home/presentation/bloc/home_event.dart';
import 'package:devflow/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDashboardUseCase getDashboardUseCase;
  final GetRecentActivityUseCase getRecentActivityUseCase;

  HomeBloc({
    required this.getRecentActivityUseCase,
    required this.getDashboardUseCase,
  }) : super(HomeState.initial()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
    on<LoadRecentActivityEvent>(_onLoadRecentActivity);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeState.loading());

    try {
      final result = await getDashboardUseCase();
      emit(HomeState.loaded(data: result, recentActivity: []));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> _onLoadRecentActivity(
    LoadRecentActivityEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final recent = await getRecentActivityUseCase();
      emit(state.copyWith(recentActivity: recent));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
