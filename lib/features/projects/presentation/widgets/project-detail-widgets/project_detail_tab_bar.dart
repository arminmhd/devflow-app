import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/domain/enum/project_detail_tab.dart';
import 'package:devflow/features/projects/presentation/bloc/project-detail/project_detail_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/project-detail/project_detail_event.dart';
import 'package:devflow/features/projects/presentation/bloc/project-detail/project_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetailTabBar extends StatelessWidget {
  const ProjectDetailTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final tabs = const [
      ('Overview', ProjectDetailTab.overview),
      ('Tasks', ProjectDetailTab.tasks),
      ('Files', ProjectDetailTab.files),
      ('Notes', ProjectDetailTab.notes),
    ];

    return BlocBuilder<ProjectDetailBloc, ProjectDetailState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabs.map((tabData) {
            final title = tabData.$1;
            final tab = tabData.$2;

            final isSelected = tab == state.selectedTab;

            return InkWell(
              onTap: () {
                context.read<ProjectDetailBloc>().add(
                  ProjectDetailTabChanged(tab),
                );
              },
              borderRadius: AppBorderRadius.sm,
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
