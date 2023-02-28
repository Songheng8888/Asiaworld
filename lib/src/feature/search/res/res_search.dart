import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:royal_landapp/src/feature/search/model/search_model.dart';

class SearchResponse {
  Future<List<SearchModel>> fetchSearchData(
      {required int item, required String query}) async {
    try {
      // print('search !');
      http.Response response = await http.get(Uri.parse(
          "http://loan.anakutjob.com/loan/anakut/api/items?row_per_page=12&page=$item&query=$query"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<SearchModel> searchModel = [];
        data['data'].forEach((e) {
          searchModel.add(SearchModel.fromJson(e));
        });
        // log(data["data"].length.toString());
        return searchModel;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw e;
    }
  }

  Future<List<SearchModel>> getSearchProperty(
      {required int item, required String query}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "http://loan.anakutjob.com/loan/anakut/api/items?row_per_page=12&page=$item&query=$query&page"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<SearchModel> _listSearch = [];
        data['data'].forEach((data) {
          _listSearch.add(SearchModel.fromJson(data));
        });
        return _listSearch;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }
}
