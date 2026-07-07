class RecentActivityEntity {
  final String type;
  final String title;
  final String description;
  final DateTime timestamp;

  const RecentActivityEntity({
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
  });
}
