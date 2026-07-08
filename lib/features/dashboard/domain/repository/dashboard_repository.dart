import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getDashboard();

  Future<List<RecentActivityEntity>> getRecentActivity();
}
