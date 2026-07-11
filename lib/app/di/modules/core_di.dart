import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/core/network/dio_client.dart';
import 'package:devflow/core/services/connectivity_service.dart';
import 'package:devflow/core/services/retry_queue_service.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> initCoreDependencies() async {
  // Services
  sl.registerLazySingleton(() => FlutterSecureStorage());
  sl.registerLazySingleton(() => ConnectivityService());
  sl.registerLazySingleton(() => RetryQueueService());
  sl.registerLazySingleton(() => TokenStorage(sl()));

  // dio
  sl.registerLazySingleton<Dio>(() => DioClient.create(sl()));
}
