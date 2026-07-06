import 'package:devflow/app/di/injector.dart';
import 'package:devflow/core/network/bloc/network_bloc.dart';
import 'package:devflow/core/network/dio_client.dart';
import 'package:devflow/core/services/connectivity_service.dart';
import 'package:devflow/core/services/retry_queue_service.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> initCoreDependencies() async {
  // dio
  sl.registerLazySingleton<Dio>(
    () => DioClient.create(TokenStorage.getAccessToken),
  );

  // Services
  sl.registerLazySingleton(() => FlutterSecureStorage());
  sl.registerLazySingleton(() => ConnectivityService());
  sl.registerLazySingleton(() => RetryQueueService());

  //global blocs
  sl.registerFactory(() => NetworkBloc(sl()));
}
