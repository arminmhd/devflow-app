import 'package:devflow/features/home/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/home/domain/entities/recent_activity_entity.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getDashboard();

  Future<List<RecentActivityEntity>> getRecentActivity();
}
