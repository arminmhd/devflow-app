import 'package:devflow/core/services/app_snackbar_service.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:devflow/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_activities.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_grid.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state.status == DashboardStatus.error) {
            AppMessenger.showError('${state.error}');
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
