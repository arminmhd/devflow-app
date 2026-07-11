import 'package:devflow/features/projects/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProject();
}
