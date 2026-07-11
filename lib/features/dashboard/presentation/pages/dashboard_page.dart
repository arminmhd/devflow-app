import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:devflow/features/dashboard/presentation/pages/dashboard_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DashboardBloc>()
        ..add(LoadDashboardEvent())
        ..add(LoadRecentActivityEvent()),
      child: DashboardView(),
    );
  }
}
