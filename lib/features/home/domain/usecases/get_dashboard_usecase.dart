import 'package:devflow/features/home/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/home/domain/repository/dashboard_repository.dart';

class GetDashboardUseCase {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  Future<DashboardEntity> call() {
    return repository.getDashboard();
  }
}
