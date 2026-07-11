import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:devflow/features/projects/data/models/project_model.dart';
import 'package:dio/dio.dart';

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Dio dio;

  const ProjectRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProjectModel>> getProject() async {
    final response = await dio.get(ApiEndpoints.projects);

    final data = response.data as List;

    return data.map((e) => ProjectModel.fromJson(e)).toList();
  }
}
