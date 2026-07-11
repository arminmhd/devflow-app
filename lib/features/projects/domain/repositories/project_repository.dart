import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> getProjects();
}
