import 'package:devflow/app/bloc/network/network_bloc.dart';
import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_event.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<AuthBloc>(
      create: (_) => sl<AuthBloc>()..add(CheckAuthStatusEvent()),
    ),

    BlocProvider<NetworkBloc>(create: (_) => sl<NetworkBloc>()),

    BlocProvider<DashboardBloc>(create: (_) => sl<DashboardBloc>()),

    BlocProvider<ProjectsBloc>(create: (_) => sl<ProjectsBloc>()),
  ];
}
