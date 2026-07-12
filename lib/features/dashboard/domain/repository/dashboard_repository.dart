import 'package:dartz/dartz.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboard();

  Future<Either<Failure, List<RecentActivityEntity>>> getRecentActivity();
}
