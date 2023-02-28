import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/project/model/project_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class ProjectRepository {
  ApiProvider _apiProvider = ApiProvider();
  String mailUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";
  Future<List<ProjectModel>> getProjects() async {
    try {
      Future.delayed(Duration(milliseconds: 200));
      String url = mailUrl + "projects";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ProjectModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(ProjectModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
