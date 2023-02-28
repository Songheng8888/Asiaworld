import 'package:equatable/equatable.dart';

abstract class CategoryBlogEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class FecthedCategoryBlogStarted extends CategoryBlogEvent{}