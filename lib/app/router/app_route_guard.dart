import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:devflow/app/router/app_route_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RouteGuard {
  static Future<String?> authRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final access = await sl<TokenStorage>().getAccessToken();

    final isLoggedIn = access != null && access.isNotEmpty;

    final isAuthRoute =
        state.matchedLocation == AppRoutePaths.signIn ||
        state.matchedLocation == AppRoutePaths.signUp;

    if (!isLoggedIn && !isAuthRoute) {
      return AppRoutePaths.signIn;
    }

    if (isLoggedIn && isAuthRoute) {
      return AppRoutePaths.home;
    }

    return null;
  }
}
