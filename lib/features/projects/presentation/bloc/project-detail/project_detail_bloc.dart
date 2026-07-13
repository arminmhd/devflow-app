import 'package:devflow/features/projects/presentation/bloc/project-detail/project_detail_event.dart';
import 'package:devflow/features/projects/presentation/bloc/project-detail/project_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProjectDetailBloc extends Bloc<ProjectDetailEvent, ProjectDetailState> {
  ProjectDetailBloc() : super(ProjectDetailState.initial()) {
    on<ProjectDetailTabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    ProjectDetailTabChanged event,
    Emitter<ProjectDetailState> emit,
  ) {
    emit(state.copyWith(event.tab));
  }
}
