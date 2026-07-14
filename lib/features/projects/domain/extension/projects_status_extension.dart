import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:flutter/material.dart';

extension ProjectStatusExtension on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.active:
        return 'Active';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.archived:
        return 'Archived';
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case ProjectStatus.active:
        return context.colors.primary;

      case ProjectStatus.completed:
        return AppColors.success;

      case ProjectStatus.archived:
        return context.colors.onSurfaceVariant;
    }
  }

  double progressValue(int progress) {
    switch (this) {
      case ProjectStatus.active:
        return progress / 100;

      case ProjectStatus.completed:
        return 100;

      case ProjectStatus.archived:
        return progress / 100;
    }
  }

  String progressPercent(int progress) {
    switch (this) {
      case ProjectStatus.active:
        return '$progress%';

      case ProjectStatus.completed:
        return "100%";

      case ProjectStatus.archived:
        return '$progress%';
    }
  }
}
