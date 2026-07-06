import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_messenger.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/home/presentation/bloc/home_bloc.dart';
import 'package:devflow/features/home/presentation/bloc/home_event.dart';
import 'package:devflow/features/home/presentation/bloc/home_state.dart';
import 'package:devflow/features/home/presentation/widgets/home_grid.dart';
import 'package:devflow/features/home/presentation/widgets/home_header.dart';
import 'package:devflow/features/home/presentation/widgets/home_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadDashboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStatus.error) {
            AppMessenger.showError('${state.error}', context);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == HomeStatus.loaded && state.data != null) {
              final dashboard = state.data!;

              return SingleChildScrollView(
                child: Padding(
                  padding: context.padding.screen,
                  child: Column(
                    children: [
                      HomeHeader(),

                      context.spacing.vLg,

                      HomeInfo(),

                      context.spacing.vLg,

                      HomeGrid(
                        projectsCount: dashboard.projectsCount,
                        tasksToday: dashboard.tasksToday,
                        totalTime: dashboard.totalTime,
                        totalIncome: dashboard.totalIncome,
                      ),
                    ],
                  ),
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
