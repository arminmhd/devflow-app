import 'package:devflow/features/dashboard/data/models/dashboard_model.dart';
import 'package:devflow/features/dashboard/data/models/recent_activity_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardModel> getDashboard();

  Future<List<RecentActivityModel>> getRecentActivity();
}
