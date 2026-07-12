import 'package:dartz/dartz.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import 'package:devflow/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecentActivityUseCase {
  final DashboardRepository repository;

  GetRecentActivityUseCase(this.repository);

  Future<Either<Failure, List<RecentActivityEntity>>> call() {
    return repository.getRecentActivity();
  }
}
