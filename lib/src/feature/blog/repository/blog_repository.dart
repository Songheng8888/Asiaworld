import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/blog/model/blog_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';


class BlogRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<List<BlogModel>> getListBlog() async {
    try {
      final String url =
          "http://opentech.anakutjobs.com/anakut/public/api/blogs";

      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<BlogModel> modelList = [];
        response.data["data"].forEach((data) {
          modelList.add(BlogModel.fromJson(data));
        });
        return modelList;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<List<CategoryBlogModel>> getListCategory() async {
    try {
      final String url =
          "http://opentech.anakutjobs.com/anakut/public/api/blog_categories";

      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        print(response.data);
        List<CategoryBlogModel> cateList = [];
        response.data["data"].forEach((data) {
          cateList.add(CategoryBlogModel.fromJson(data));
        });
        return cateList;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<List<BlogModel>> getListBlogByCategory({required String? id}) async {
    try {
      final String url =
          "http://opentech.anakutjobs.com/anakut/public/api/blogs?category_id=$id";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<BlogModel> modelList = [];
        response.data["data"].forEach((data) {
          modelList.add(BlogModel.fromJson(data));
        });
        return modelList;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<BlogModel> getBlogById({required String? id}) async {
    try {
      final String url =
          "http://opentech.anakutjobs.com/anakut/public/api/blogs/$id";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        print(response.data);
        return BlogModel.fromJson(response.data["data"]);
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<CategoryBlogModel> getCategoryBlocById({required String? id}) async {
    try {
      final String url =
          "http://opentech.anakutjobs.com/anakut/public/api/blog_categories/$id";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        print(response.data);
        return CategoryBlogModel.fromJson(response.data["data"]);
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
