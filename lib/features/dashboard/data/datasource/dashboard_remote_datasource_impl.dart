import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

import 'package:devflow/features/dashboard/data/models/dashboard_model.dart';
import 'package:devflow/features/dashboard/data/models/recent_activity_model.dart';
import 'package:devflow/features/dashboard/data/datasource/dashboard_remote_datasource.dart';

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio client;
  final Talker talker;

  DashboardRemoteDataSourceImpl(this.client, this.talker);

  @override
  Future<DashboardModel> getDashboard() async {
    try {
      final response = await client.get('/dashboard/');

      return DashboardModel.fromJson(response.data);
    } catch (e, st) {
      talker.error('DashboardRemoteDataSourceImpl.getDashboard error', e, st);
      rethrow;
    }
  }

  @override
  Future<List<RecentActivityModel>> getRecentActivity() async {
    try {
      final response = await client.get('/dashboard/recent-activity/');
      final list = (response.data as List)
          .map((json) => RecentActivityModel.fromJson(json))
          .toList();
      return list;
    } catch (e, st) {
      talker.error(
        'DashboardRemoteDataSourceImpl.getRecentActivity error',
        e,
        st,
      );
      rethrow;
    }
  }
}
