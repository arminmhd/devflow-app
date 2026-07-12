import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:flutter/material.dart';

extension ProjectStatusExtension on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.active:
        return "Active";

      case ProjectStatus.completed:
        return "Completed";

      case ProjectStatus.archived:
        return "Archived";
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case ProjectStatus.active:
        return context.colors.tertiaryContainer;

      case ProjectStatus.completed:
        return context.colors.primary;

      case ProjectStatus.archived:
        return context.colors.secondaryContainer;
    }
  }
}
