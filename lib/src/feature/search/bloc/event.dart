import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class FetchSearch extends SearchEvent {
  String query;
  FetchSearch({required this.query});
}

//history
class FetchSearchHistory extends SearchEvent {}
