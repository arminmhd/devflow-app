import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:devflow/features/dashboard/data/datasource/dashboard_remote_datasource_impl.dart';
import 'package:devflow/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:devflow/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:devflow/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:devflow/features/dashboard/domain/usecases/get_recent_activity_usecase.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_bloc.dart';

Future<void> initDashboardDependencies() async {
  //dataSource
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDatasourceImpl(sl()),
  );

  //Repository
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(sl()),
  );

  //useCases
  sl.registerLazySingleton(() => GetDashboardUseCase(sl()));
  sl.registerLazySingleton(() => GetRecentActivityUseCase(sl()));

  //bloc
  sl.registerFactory(
    () => DashboardBloc(
      getDashboardUseCase: sl(),
      getRecentActivityUseCase: sl(),
    ),
  );
}
