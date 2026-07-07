import 'package:devflow/features/home/data/models/dashboard_model.dart';
import 'package:devflow/features/home/data/models/recent_activity_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardModel> getDashboard();

  Future<List<RecentActivityModel>> getRecentActivity();
}
