import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import 'package:devflow/features/dashboard/domain/repository/dashboard_repository.dart';

class GetRecentActivityUseCase {
  final DashboardRepository repository;

  GetRecentActivityUseCase(this.repository);

  Future<List<RecentActivityEntity>> call() {
    return repository.getRecentActivity();
  }
}
