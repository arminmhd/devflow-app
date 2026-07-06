import 'package:devflow/app/di/injector.dart';
import 'package:devflow/features/home/data/datasource/dashboard_remote_datasource.dart';
import 'package:devflow/features/home/data/datasource/dashboard_remote_datasource_impl.dart';
import 'package:devflow/features/home/data/repository/dashboard_repository_impl.dart';
import 'package:devflow/features/home/domain/repository/dashboard_repository.dart';
import 'package:devflow/features/home/domain/usecases/get_dashboard_usecase.dart';
import 'package:devflow/features/home/presentation/bloc/home_bloc.dart';

Future<void> initHomeDependencies() async {
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

  //bloc
  sl.registerFactory(() => HomeBloc(sl()));
}
