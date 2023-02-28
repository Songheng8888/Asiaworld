import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:royal_landapp/src/feature/search/model/search_model.dart';

@immutable
class SearchState extends Equatable {
  SearchState([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class Initializing extends SearchState {}

class FetchingSearchState extends SearchState {
  final bool initSearch;
  FetchingSearchState({this.initSearch = true});
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class FetchSearchState extends SearchState {
  List<SearchModel> data = [];
  @override
  List<Object?> get props => [data];
}

// ignore: must_be_immutable
class ErrorSearchState extends SearchState {
  String error;
  ErrorSearchState({required this.error});
  @override
  List<Object?> get props => [error];
}

// History

// ignore: must_be_immutable
class FetchStateHistory extends FetchSearchState {
  final List<String> history;
  FetchStateHistory({required this.history});
}
