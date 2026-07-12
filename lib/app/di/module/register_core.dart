import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:devflow/core/network/client/dio_client.dart';
import 'package:devflow/core/services/connectivity_service.dart';
import 'package:devflow/core/services/retry_queue_service.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

@module
abstract class RegisterCore {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  ConnectivityService connectivityService(Connectivity connectivity) =>
      ConnectivityService(connectivity);

  @lazySingleton
  RetryQueueService get retryQueueService => RetryQueueService();

  @lazySingleton
  TokenStorage tokenStorage(FlutterSecureStorage storage) =>
      TokenStorage(storage);

  @lazySingleton
  Talker get talker => Talker();

  @lazySingleton
  Dio dio(TokenStorage tokenStorage) => DioClient.create(tokenStorage);
}
