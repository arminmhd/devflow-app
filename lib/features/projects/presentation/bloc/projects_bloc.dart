import 'package:devflow/features/projects/presentation/bloc/projects_event.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsState.initial()) {
    on<ProjectTabChanged>(_onProjectTabChanged);
  }

  void _onProjectTabChanged(
    ProjectTabChanged event,
    Emitter<ProjectsState> emit,
  ) {
    emit(ProjectsState(selectedTab: event.tab));
  }
}
