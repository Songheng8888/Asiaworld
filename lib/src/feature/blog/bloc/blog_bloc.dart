import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:royal_landapp/src/feature/blog/bloc/index.dart';
import 'package:royal_landapp/src/feature/blog/model/blog_model.dart';
import 'package:royal_landapp/src/feature/blog/repository/blog_repository.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(FetchingBlog());
  BlogRepository blogRepository = BlogRepository();
  List<BlogModel> blogmodelList = [];
  BlogModel? blogModel;
  @override
  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is FetchedBlogStarted) {
      yield FetchingBlog();
      try {
        Future.delayed(Duration(milliseconds: 200));
        List<BlogModel> tempList = await blogRepository.getListBlog();
        blogmodelList.addAll(tempList);
        yield FetchedBlog();
      } catch (e) {
        yield ErrorFetcingBlog(error: e.toString());
      }
    }
    if (event is FetchedBlogByCategoryStarted) {
      yield FetchingBlog();
      try {
        Future.delayed(Duration(milliseconds: 200));
        List<BlogModel> tempList =
            await blogRepository.getListBlogByCategory(id: event.id);
        blogmodelList.addAll(tempList);
        yield FetchedBlog();
      } catch (e) {
        yield ErrorFetcingBlog(error: e.toString());
      }
    }
    if (event is FetchedBlogByIdStarted) {
      yield FetchingBlog();
      try {
        Future.delayed(Duration(milliseconds: 200));
        blogModel = await blogRepository.getBlogById(id: event.id);
        yield FetchedBlog();
      } catch (e) {
        print(e.toString());
        yield ErrorFetcingBlog(error: e.toString());
      }
    }
  }
}
