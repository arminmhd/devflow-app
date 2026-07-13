import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/domain/enum/project_tab.dart';
import 'package:devflow/features/projects/presentation/bloc/project/projects_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/project/projects_event.dart';
import 'package:devflow/features/projects/presentation/bloc/project/projects_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsTabWidget extends StatelessWidget {
  const ProjectsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    const tabs = [
      ('All', ProjectTab.all),
      ('Active', ProjectTab.active),
      ('Completed', ProjectTab.completed),
      ('Archived', ProjectTab.archived),
    ];

    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabs.map((tabData) {
            final title = tabData.$1;
            final tab = tabData.$2;

            final isSelected = tab == state.selectedTab;

            return InkWell(
              borderRadius: AppBorderRadius.sm,
              onTap: () {
                context.read<ProjectsBloc>().add(ProjectTabChanged(tab));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: AppInsets.md,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.sm,
                  color: isSelected
                      ? colors.primaryContainer
                      : Colors.transparent,
                  border: isSelected
                      ? Border(
                          bottom: BorderSide(color: colors.primary, width: 2),
                        )
                      : null,
                ),
                child: AppText(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: isSelected
                        ? colors.onPrimaryContainer
                        : colors.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
