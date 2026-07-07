import 'package:devflow/features/home/domain/entities/recent_activity_entity.dart';
import 'package:devflow/features/home/domain/repository/dashboard_repository.dart';

class GetRecentActivityUseCase {
  final DashboardRepository repository;

  GetRecentActivityUseCase(this.repository);

  Future<List<RecentActivityEntity>> call() {
    return repository.getRecentActivity();
  }
}
