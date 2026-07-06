import 'package:devflow/features/home/domain/usecases/get_dashboard_usecase.dart';
import 'package:devflow/features/home/presentation/bloc/home_event.dart';
import 'package:devflow/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDashboardUseCase getDashboardUseCase;

  HomeBloc(this.getDashboardUseCase) : super(HomeState.initial()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeState.loading());

    try {
      final result = await getDashboardUseCase();
      emit(HomeState.loaded(result));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
