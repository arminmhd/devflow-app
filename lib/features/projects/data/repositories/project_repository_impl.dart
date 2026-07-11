import 'package:devflow/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remote;

  ProjectRepositoryImpl(this.remote);

  @override
  Future<List<ProjectEntity>> getProjects() async {
    final models = await remote.getProject();

    return models;
  }
}
