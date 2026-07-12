import 'package:dartz/dartz.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDashboardUseCase {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  Future<Either<Failure, DashboardEntity>> call() {
    return repository.getDashboard();
  }
}
