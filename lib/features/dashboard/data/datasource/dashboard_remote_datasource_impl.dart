import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:devflow/features/dashboard/data/models/dashboard_model.dart';
import 'package:devflow/features/dashboard/data/models/recent_activity_model.dart';
import 'package:dio/dio.dart';

class DashboardRemoteDatasourceImpl implements DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDatasourceImpl(this.dio);

  @override
  Future<DashboardModel> getDashboard() async {
    final response = await dio.get(ApiEndpoints.dashboard);
    return DashboardModel.fromJson(response.data);
  }

  @override
  Future<List<RecentActivityModel>> getRecentActivity() async {
    final response = await dio.get(ApiEndpoints.recentActivity);

    return (response.data as List)
        .map((e) => RecentActivityModel.fromJson(e))
        .toList();
  }
}
