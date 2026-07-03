import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/features/auth/presentation/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';
import 'app_route_paths.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutePaths.signIn,
    // redirect: RouteGuard.authRedirect,
    routes: [
      GoRoute(
        path: AppRoutePaths.signIn,
        name: AppRouteNames.signIn,
        builder: (_, _) => const SignInPage(),
      ),
      // GoRoute(
      //   path: AppRoutePaths.signUp,
      //   name: AppRouteNames.signUp,
      //   builder: (_, _) => const SignUpPage(),
      // ),
    ],
  );
}
