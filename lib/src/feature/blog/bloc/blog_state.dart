import 'package:equatable/equatable.dart';


abstract class BlogState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchingBlog extends BlogState {}

class FetchedBlog extends BlogState {}

class ErrorFetcingBlog extends BlogState {
  final dynamic error;
  ErrorFetcingBlog({required this.error});
}
