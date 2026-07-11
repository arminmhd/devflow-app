import 'package:devflow/core/storage/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage storage;

  TokenStorage(this.storage);

  Future<String?> getAccessToken() {
    return storage.read(key: StorageKeys.accessToken);
  }

  Future<String?> getRefreshToken() {
    return storage.read(key: StorageKeys.refreshToken);
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await storage.write(key: StorageKeys.accessToken, value: accessToken);

    await storage.write(key: StorageKeys.refreshToken, value: refreshToken);
  }

  Future<void> clearTokens() async {
    await storage.delete(key: StorageKeys.accessToken);

    await storage.delete(key: StorageKeys.refreshToken);
  }
}
