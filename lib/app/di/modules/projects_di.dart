import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:devflow/features/projects/data/datasources/project_remote_datasource_impl.dart';
import 'package:devflow/features/projects/data/repositories/project_repository_impl.dart';
import 'package:devflow/features/projects/domain/repositories/project_repository.dart';
import 'package:devflow/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';

Future<void> initProjectsDependencies() async {
  //dataSources
  sl.registerLazySingleton<ProjectRemoteDataSource>(
    () => ProjectRemoteDataSourceImpl(sl()),
  );

  //repositories

  sl.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(sl()),
  );

  //DataSources
  sl.registerLazySingleton(() => GetProjectsUseCase(sl()));

  //bloc
  sl.registerFactory(() => ProjectsBloc(getProjectsUseCase: sl()));
}
