import 'package:equatable/equatable.dart';


abstract class CategoryBlogState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchingCategoryBlog extends CategoryBlogState {}

class FetchedCategoryBlog extends CategoryBlogState {}

class ErrorFetchingCategoryBlog extends CategoryBlogState {

  final dynamic error;
  ErrorFetchingCategoryBlog({required this.error});
}
