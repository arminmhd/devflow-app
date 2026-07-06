import 'package:devflow/app/di/modules/auth_di.dart';
import 'package:devflow/app/di/modules/core_di.dart';
import 'package:devflow/app/di/modules/home_di.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class Injector {
  static Future<void> init() async {
    await initCoreDependencies();

    await initAuthDependencies();

    await initHomeDependencies();
  }
}
