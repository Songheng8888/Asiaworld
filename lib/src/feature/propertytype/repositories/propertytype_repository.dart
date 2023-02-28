import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class PropertyTypeRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<PropertyTypeModel>> getPropertyTypeList() async {
    try {
      String url =
          "http://loan.anakutjob.com/loan/anakut/public/api/item_types?row_per_page=100&page=1&vendor_code=loan";
      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        List<PropertyTypeModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(PropertyTypeModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
