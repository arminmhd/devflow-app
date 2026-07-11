import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/domain/repositories/project_repository.dart';

class GetProjectsUseCase {
  final ProjectRepository repository;

  GetProjectsUseCase(this.repository);

  Future<List<ProjectEntity>> call()  {
    return  repository.getProjects();
  }
}
