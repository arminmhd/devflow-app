import 'package:devflow/app/di/injector.dart';
import 'package:devflow/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devflow/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:devflow/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';
import 'package:devflow/features/auth/domian/usecases/login_usecase.dart';
import 'package:devflow/features/auth/domian/usecases/register_usecase.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';

Future<void> initAuthDependencies() async {
  // DataSource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(loginUseCase: sl(), registerUseCase: sl(), storage: sl()),
  );
}
