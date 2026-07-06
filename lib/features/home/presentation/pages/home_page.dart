import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/home/presentation/widgets/home_grid.dart';
import 'package:devflow/features/home/presentation/widgets/home_header.dart';
import 'package:devflow/features/home/presentation/widgets/home_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: context.padding.screen,
          child: Column(
            children: [
              HomeHeader(),

              context.spacing.vLg,

              HomeInfo(),

              context.spacing.vLg,

              HomeGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
