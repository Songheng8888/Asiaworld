import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/project/bloc/index.dart';
import 'package:royal_landapp/src/feature/project/model/project_model.dart';
import 'package:royal_landapp/src/feature/project/repository/markety_type_repository.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(FetchingProject());
  ProjectRepository projectRepository = ProjectRepository();
  List<ProjectModel> project = [];
  @override
  Stream<ProjectState> mapEventToState(ProjectEvent event) async* {
    if (event is FetchProjectStarted) {
      yield FetchingProject();
      try {
        Future.delayed(Duration(milliseconds: 200));
        project = await projectRepository.getProjects();
        yield FetchedProject();
      } catch (e) {
        yield ErrorFetchingProject(error: e.toString());
      }
    }
  }
}
