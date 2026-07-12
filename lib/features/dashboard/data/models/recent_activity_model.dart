import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/recent_activity_entity.dart';

part 'recent_activity_model.g.dart';

@JsonSerializable()
class RecentActivityModel {
  final String type;
  final String title;
  final String? description;
  final String timestamp;

  const RecentActivityModel({
    required this.type,
    required this.title,
    this.description,
    required this.timestamp,
  });

  /// JSON → Model
  factory RecentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityModelFromJson(json);

  /// Model → JSON
  Map<String, dynamic> toJson() => _$RecentActivityModelToJson(this);

  /// Model → Entity
  RecentActivityEntity toEntity() {
    return RecentActivityEntity(
      type: _mapType(type),
      title: title,
      description: description,
      timestamp: DateTime.parse(timestamp),
    );
  }

  /// Convert string → enum
  ActivityType _mapType(String value) {
    switch (value.toLowerCase()) {
      case 'project':
        return ActivityType.project;
      case 'task':
        return ActivityType.task;
      case 'note':
        return ActivityType.note;
      case 'income':
        return ActivityType.income;
      case 'time':
        return ActivityType.time;
      default:
        return ActivityType.task; // fallback
    }
  }
}
