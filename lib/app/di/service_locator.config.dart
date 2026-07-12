// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker/talker.dart' as _i993;

import '../../core/services/connectivity_service.dart' as _i820;
import '../../core/services/retry_queue_service.dart' as _i77;
import '../../core/storage/token_storage.dart' as _i1001;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/auth_remote_datasource_impl.dart'
    as _i1071;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/check_auth_status_use_case.dart'
    as _i489;
import '../../features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i17;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/dashboard/data/datasource/dashboard_remote_datasource.dart'
    as _i454;
import '../../features/dashboard/data/datasource/dashboard_remote_datasource_impl.dart'
    as _i587;
import '../../features/dashboard/data/repository/dashboard_repository_impl.dart'
    as _i604;
import '../../features/dashboard/domain/repository/dashboard_repository.dart'
    as _i275;
import '../../features/dashboard/domain/usecases/get_dashboard_usecase.dart'
    as _i803;
import '../../features/dashboard/domain/usecases/get_recent_activity_usecase.dart'
    as _i461;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
import '../../features/projects/data/datasources/project_remote_datasource.dart'
    as _i1059;
import '../../features/projects/data/datasources/project_remote_datasource_impl.dart'
    as _i88;
import '../../features/projects/data/repositories/project_repository_impl.dart'
    as _i62;
import '../../features/projects/domain/repositories/project_repository.dart'
    as _i338;
import '../../features/projects/domain/usecases/get_projects_usecase.dart'
    as _i393;
import '../../features/projects/presentation/bloc/projects_bloc.dart' as _i977;
import '../bloc/network/network_bloc.dart' as _i849;
import 'module/register_core.dart' as _i927;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerCore = _$RegisterCore();
    gh.lazySingleton<_i895.Connectivity>(() => registerCore.connectivity);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerCore.secureStorage,
    );
    gh.lazySingleton<_i77.RetryQueueService>(
      () => registerCore.retryQueueService,
    );
    gh.lazySingleton<_i993.Talker>(() => registerCore.talker);
    gh.lazySingleton<_i1001.TokenStorage>(
      () => registerCore.tokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i820.ConnectivityService>(
      () => registerCore.connectivityService(gh<_i895.Connectivity>()),
    );
    gh.factory<_i849.NetworkBloc>(
      () => _i849.NetworkBloc(gh<_i820.ConnectivityService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerCore.dio(gh<_i1001.TokenStorage>()),
    );
    gh.lazySingleton<_i1059.ProjectRemoteDataSource>(
      () => _i88.ProjectRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i1071.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i338.ProjectRepository>(
      () => _i62.ProjectRepositoryImpl(gh<_i1059.ProjectRemoteDataSource>()),
    );
    gh.lazySingleton<_i454.DashboardRemoteDataSource>(
      () => _i587.DashboardRemoteDataSourceImpl(
        gh<_i361.Dio>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i1001.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i275.DashboardRepository>(
      () => _i604.DashboardRepositoryImpl(
        gh<_i454.DashboardRemoteDataSource>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.factory<_i803.GetDashboardUseCase>(
      () => _i803.GetDashboardUseCase(gh<_i275.DashboardRepository>()),
    );
    gh.factory<_i461.GetRecentActivityUseCase>(
      () => _i461.GetRecentActivityUseCase(gh<_i275.DashboardRepository>()),
    );
    gh.factory<_i393.GetProjectsUseCase>(
      () => _i393.GetProjectsUseCase(gh<_i338.ProjectRepository>()),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(
        getDashboardUseCase: gh<_i803.GetDashboardUseCase>(),
        getRecentActivityUseCase: gh<_i461.GetRecentActivityUseCase>(),
      ),
    );
    gh.factory<_i489.CheckAuthStatusUseCase>(
      () => _i489.CheckAuthStatusUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        loginUseCase: gh<_i188.LoginUseCase>(),
        registerUseCase: gh<_i941.RegisterUseCase>(),
        currentUserUseCase: gh<_i17.GetCurrentUserUseCase>(),
        checkAuthStatusUseCase: gh<_i489.CheckAuthStatusUseCase>(),
      ),
    );
    gh.factory<_i977.ProjectsBloc>(
      () => _i977.ProjectsBloc(
        getProjectsUseCase: gh<_i393.GetProjectsUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterCore extends _i927.RegisterCore {}
