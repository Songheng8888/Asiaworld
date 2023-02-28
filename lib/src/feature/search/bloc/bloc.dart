import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/search/bloc/event.dart';
import 'package:royal_landapp/src/feature/search/bloc/state.dart';
import 'package:royal_landapp/src/feature/search/model/search_model.dart';
import 'package:royal_landapp/src/feature/search/res/res_search.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  String query = '';
  int searchPropery = 0;
  List<SearchModel>? results = [];
  List<SearchModel>? searchModel = [];

  SearchBloc() : super(FetchingSearchState());
  SearchResponse searchResponse = SearchResponse();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchSearch) {
      results!.clear();
      searchModel!.clear();
      print(results!.length);
      yield (FetchingSearchState());
      try {
        if (event.query != query) {
          query = event.query;
          searchPropery = 1;
          yield FetchingSearchState();
        }
        List<SearchModel> tmp = await searchResponse.fetchSearchData(
            item: searchPropery, query: event.query);
        List<SearchModel> tmpSearch = await searchResponse.getSearchProperty(
            item: searchPropery, query: event.query);
        results!.addAll(tmp);
        searchModel!.addAll(tmpSearch);
        yield FetchSearchState();
      } catch (e) {
        yield ErrorSearchState(error: e.toString());
      }
      // try {
      //   Future.delayed(Duration(milliseconds: 200));
      //   List<SearchModel> tmp = await searchResponse.fetchSearchData();
      //   searchModel.addAll(tmp);
      //   //log(searchModel.length.toString());
      //   yield (FetchSearchState());
      // } catch (e) {
      //   yield (ErrorSearchState(error: e.toString()));
      // }
    }
  }
}
