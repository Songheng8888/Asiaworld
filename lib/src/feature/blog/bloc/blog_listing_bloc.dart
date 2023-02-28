import 'package:bloc/bloc.dart';
import 'package:royal_landapp/src/feature/blog/model/blog_model.dart';
import 'package:royal_landapp/src/feature/blog/repository/blog_listing_repository.dart';
// import 'package:flutter/widgets.dart';

import 'index.dart';

class BlogListingBloc extends Bloc<BlogListingEvent, BlogListingState> {
  BlogListingBloc({required this.blogListingRepository, this.rowPerPage = 10})
      : super(InitializingBlogList());

  final BlogListingRepository blogListingRepository;
  int page = 1;
  List<BlogModel> blogList = [];
  final int rowPerPage;
  @override
  Stream<BlogListingState> mapEventToState(BlogListingEvent event) async* {
    if (event is InitializeBlogList) {
      yield InitializingBlogList();
      try {
        page = 1;
        blogList = await blogListingRepository.getBlogList(
            page: page, rowPerPage: rowPerPage, additionalArg: event.arg);
        page++;
        print(blogList.length);
        yield InitializedBlogList();
      } catch (e) {
        print(e);
        yield ErrorInitializingBlogList(error: e.toString());
      }
    }
    if (event is FetchBlogList) {
      yield FetchingBlogList();
      try {
        List<BlogModel> _tempBlogList = await blogListingRepository.getBlogList(
            page: page, rowPerPage: rowPerPage, additionalArg: event.arg);
        blogList.addAll(_tempBlogList);
        page++;
        if (_tempBlogList.length < rowPerPage) {
          yield EndOfBlogList();
        } else {
          yield FetchedBlogList();
        }
      } catch (e) {
        yield ErrorInitializingBlogList(error: e.toString());
      }
    }
  }
}
