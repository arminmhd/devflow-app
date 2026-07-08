import 'package:devflow/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepositoryImpl(this.remote);

  @override
  Future<DashboardEntity> getDashboard() {
    return remote.getDashboard();
  }

  @override
  Future<List<RecentActivityEntity>> getRecentActivity() async {
    return remote.getRecentActivity();
  }
}
