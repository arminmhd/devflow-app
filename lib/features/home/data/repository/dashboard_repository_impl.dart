import 'package:devflow/features/home/data/datasource/dashboard_remote_datasource.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepositoryImpl(this.remote);

  @override
  Future<DashboardEntity> getDashboard() {
    return remote.getDashboard();
  }
}
