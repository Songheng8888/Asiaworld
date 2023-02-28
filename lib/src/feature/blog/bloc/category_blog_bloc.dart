import 'package:royal_landapp/src/feature/blog/bloc/index.dart';
import 'package:royal_landapp/src/feature/blog/repository/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/blog/model/blog_model.dart';

class CategoryBlogBloc extends Bloc<CategoryBlogEvent, CategoryBlogState> {
  CategoryBlogBloc() : super(FetchingCategoryBlog());
  BlogRepository blogRepository = BlogRepository();
  List<CategoryBlogModel> categoryBlogModel = [];
  @override
  Stream<CategoryBlogState> mapEventToState(CategoryBlogEvent event) async* {
    if (event is FecthedCategoryBlogStarted) {
      yield FetchingCategoryBlog();
      try {
        Future.delayed(Duration(milliseconds: 200));
        categoryBlogModel = await blogRepository.getListCategory();
        yield FetchedCategoryBlog();
      } catch (e) {
        yield ErrorFetchingCategoryBlog(error: e.toString());
      }
    }
  }
}
