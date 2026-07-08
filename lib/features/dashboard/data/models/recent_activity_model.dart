import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';

class RecentActivityModel extends RecentActivityEntity {
  RecentActivityModel({
    required super.type,
    required super.title,
    required super.description,
    required super.timestamp,
  });

  factory RecentActivityModel.fromJson(Map<String, dynamic> json) {
    return RecentActivityModel(
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
