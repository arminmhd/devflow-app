import 'package:devflow/app/di/injector.dart';
import 'package:devflow/core/network/dio_client.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> initCoreDependencies() async {
  // dio
  sl.registerLazySingleton<Dio>(
    () => DioClient.create(TokenStorage.getAccessToken),
  );

  // Storage
  sl.registerLazySingleton(() => FlutterSecureStorage());
}
