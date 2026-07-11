import 'package:devflow/app/di/modules/auth_di.dart';
import 'package:devflow/app/di/modules/core_di.dart';
import 'package:devflow/app/di/modules/dashboard_di.dart';
import 'package:devflow/app/di/modules/projects_di.dart';

class Injector {
  static Future<void> init() async {
    await initCoreDependencies();

    await initAuthDependencies();

    await initDashboardDependencies();

    await initProjectsDependencies();
  }
}
