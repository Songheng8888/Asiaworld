import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BlogListingState extends Equatable {
  const BlogListingState();

  @override
  List<Object> get props => [];
}

class InitializingBlogList extends BlogListingState {}

class InitializedBlogList extends BlogListingState {}

class FetchingBlogList extends BlogListingState {}

class FetchedBlogList extends BlogListingState {}

class EndOfBlogList extends BlogListingState {}

class ErrorFetchingBlogList extends BlogListingState {
  final dynamic error;
  ErrorFetchingBlogList({required this.error});
}

class ErrorInitializingBlogList extends BlogListingState {
  final dynamic error;
  ErrorInitializingBlogList({required this.error});
}
