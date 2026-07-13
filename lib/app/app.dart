import 'package:devflow/app/listeners/app_listeners.dart';
import 'package:devflow/app/providers/app_bloc_providers.dart';
import 'package:devflow/app/router/app_router.dart';
import 'package:devflow/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevFlowApp extends StatelessWidget {
  const DevFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: AppBlocProviders.providers,
          child: AppListeners(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
            ),
          ),
        );
      },
    );
  }
}
