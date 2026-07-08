import 'package:devflow/app/di/injector.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';

Future<void> initProjectsDependencies() async {
  sl.registerFactory(() => ProjectsBloc());
}
