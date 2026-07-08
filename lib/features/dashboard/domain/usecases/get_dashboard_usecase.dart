import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/repository/dashboard_repository.dart';

class GetDashboardUseCase {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  Future<DashboardEntity> call() {
    return repository.getDashboard();
  }
}
