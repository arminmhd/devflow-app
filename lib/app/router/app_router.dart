import 'package:devflow/app/navigation/navigation_shell.dart';
import 'package:devflow/app/router/app_route_guard.dart';
import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/features/auth/presentation/pages/sign_in_page.dart';
import 'package:devflow/features/auth/presentation/pages/sign_up_page.dart';
import 'package:devflow/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:devflow/features/projects/presentation/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_route_paths.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutePaths.signIn,
    redirect: RouteGuard.authRedirect,
    routes: [
      GoRoute(
        path: AppRoutePaths.signIn,
        name: AppRouteNames.signIn,
        builder: (_, _) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutePaths.signUp,
        name: AppRouteNames.signUp,
        builder: (_, _) => const SignUpPage(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => NavigationShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.home,
                name: AppRouteNames.home,
                builder: (_, _) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.projects,
                name: AppRouteNames.projects,
                builder: (_, _) => ProjectsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.tasks,
                name: AppRouteNames.tasks,
                builder: (_, _) => Container(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.timer,
                name: AppRouteNames.timer,
                builder: (_, _) => Container(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.more,
                name: AppRouteNames.more,
                builder: (_, _) => Container(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
