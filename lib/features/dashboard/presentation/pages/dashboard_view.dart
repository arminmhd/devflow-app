import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
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
            AppMessenger.showError(state.error ?? 'Something went wrong');
          }
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state.status == DashboardStatus.loading ||
                state.status == DashboardStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == DashboardStatus.error) {
              return Center(
                child: Text(
                  state.error ?? 'Something went wrong',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.status == DashboardStatus.loaded && state.data != null) {
              final dashboard = state.data!;

              return Padding(
                padding: AppInsets.screen,
                child: Column(
                  children: [
                    const DashboardInfo(),

                    AppSpaces.lg,

                    DashboardGrid(
                      projectsCount: dashboard.projectsCount,
                      tasksToday: dashboard.todayTasks,
                      totalTime: dashboard.timeTodayMinutes,
                      totalIncome: dashboard.incomeThisMonth,
                    ),

                    AppSpaces.vMd,

                    Expanded(
                      child: DashboardActivities(
                        activities: state.recentActivity,
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
