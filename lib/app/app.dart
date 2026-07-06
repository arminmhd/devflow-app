import 'package:devflow/app/di/injector.dart';
import 'package:devflow/app/router/app_router.dart';
import 'package:devflow/core/network/bloc/network_bloc.dart';
import 'package:devflow/core/network/bloc/network_state.dart';
import 'package:devflow/core/services/retry_queue_service.dart';
import 'package:devflow/core/utils/app_messenger.dart';
import 'package:devflow/core/theme/app_theme.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),

          BlocProvider<NetworkBloc>(create: (context) => sl<NetworkBloc>()),
        ],
        child: BlocListener<NetworkBloc, NetworkState>(
          listener: (context, state) {
            checkConnectivity(state, context);
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
      ),
    );
  }

  Future checkConnectivity(NetworkState state, BuildContext context) async {
    if (state.isConnected) {
      final retryQueue = sl<RetryQueueService>();
      final dio = sl<Dio>();

      for (final request in retryQueue.pendingRequest) {
        try {
          await dio.fetch(request);
        } catch (_) {}
      }

      retryQueue.clear();
    }

    if (!state.isConnected) {
      AppMessenger.showError('You were disconnected', context);
    }
  }
}
