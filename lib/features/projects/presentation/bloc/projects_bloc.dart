import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_event.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjectsUseCase getProjectsUseCase;

  ProjectsBloc({required this.getProjectsUseCase})
    : super(ProjectsState.initial()) {
    on<ProjectTabChanged>(_onProjectTabChanged);
    on<LoadProjectsEvent>(_onLoadProjects);
    on<RefreshProjectsEvent>(_onRefreshProjects);
  }

  void _onProjectTabChanged(
    ProjectTabChanged event,
    Emitter<ProjectsState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.tab));
    add(const LoadProjectsEvent());
  }

  Future<void> _onLoadProjects(
    LoadProjectsEvent event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final projects = await getProjectsUseCase();
      emit(state.copyWith(isLoading: false, projects: projects, error: null));
    } catch (e) {
      final failure = e is Failure ? e : UnknownFailure("Unexpected error");
      emit(state.copyWith(error: failure.message, isLoading: false));
    }
  }

  Future<void> _onRefreshProjects(
    RefreshProjectsEvent event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final projects = await getProjectsUseCase();
      emit(state.copyWith(projects: projects, isLoading: false, error: null));
    } catch (e) {
      final failure = e is Failure ? e : UnknownFailure("Unexpected error");
      emit(state.copyWith(error: failure.message, isLoading: false));
    }
  }
}
