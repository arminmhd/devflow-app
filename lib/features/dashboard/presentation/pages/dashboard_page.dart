import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_messenger.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_activities.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_grid.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(LoadDashboardEvent());
    context.read<DashboardBloc>().add(LoadRecentActivityEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state.status == DashboardStatus.error) {
            AppMessenger.showError('${state.error}', context);
          }
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state.status == DashboardStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == DashboardStatus.loaded && state.data != null) {
              final dashboard = state.data!;

              return Padding(
                padding: context.padding.screen,
                child: Column(
                  children: [
                    DashboardInfo(),

                    context.spacing.vLg,

                    DashboardGrid(
                      projectsCount: dashboard.projectsCount,
                      tasksToday: dashboard.tasksToday,
                      totalTime: dashboard.totalTime,
                      totalIncome: dashboard.totalIncome,
                    ),

                    context.spacing.vMd,

                    Expanded(
                      child: DashboardActivities(
                        activities: state.recentActivity!,
                      ),
                    ),
                  ],
                ),
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
