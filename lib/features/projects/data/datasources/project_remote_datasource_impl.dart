import 'package:devflow/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:devflow/features/projects/data/models/project_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProjectRemoteDataSource)
class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Dio dio;

  ProjectRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProjectModel>> getProject() async {
    final response = await dio.get('/projects');

    return (response.data as List)
        .map((json) => ProjectModel.fromJson(json))
        .toList();
  }
}
