import 'package:devflow/app/bloc/network/network_bloc.dart';
import 'package:devflow/app/bloc/network/network_state.dart';
import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/app/router/app_router.dart';
import 'package:devflow/core/services/app_snackbar_service.dart';
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
        return BlocProvider(
          create: (_) => sl<NetworkBloc>(),

          child: BlocListener<NetworkBloc, NetworkState>(
            listener: (context, state) {
              if (!state.isConnected) {
                AppMessenger.showError('You were disconnected');
              }
            },

            child: MaterialApp.router(
              title: 'DevFlow',

              debugShowCheckedModeBanner: false,

              scaffoldMessengerKey: AppMessenger.key,

              theme: AppTheme.lightTheme,

              darkTheme: AppTheme.darkTheme,

              themeMode: ThemeMode.system,

              routerConfig: AppRouter.router,
            ),
          ),
        );
      },
    );
  }
}
