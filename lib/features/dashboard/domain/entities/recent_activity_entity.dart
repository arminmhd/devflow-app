import 'package:equatable/equatable.dart';

enum ActivityType { project, task, note, income, time }

class RecentActivityEntity extends Equatable {
  final ActivityType type;
  final String title;
  final String? description;
  final DateTime timestamp;

  const RecentActivityEntity({
    required this.type,
    required this.title,
    this.description,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [type, title, description, timestamp];
}
