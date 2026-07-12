import 'package:dartz/dartz.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:devflow/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:devflow/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import 'package:devflow/features/dashboard/domain/repository/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;
  final Talker talker;

  DashboardRepositoryImpl(this.remote, this.talker);

  @override
  Future<Either<Failure, DashboardEntity>> getDashboard() async {
    try {
      final model = await remote.getDashboard();
      return Right(model.toEntity());
    } catch (e, st) {
      talker.error('DashboardRepositoryImpl.getDashboard error', e, st);
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecentActivityEntity>>>
  getRecentActivity() async {
    try {
      final models = await remote.getRecentActivity();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e, st) {
      talker.error('DashboardRepositoryImpl.getRecentActivity error', e, st);
      return Left(UnknownFailure(e.toString()));
    }
  }
}
