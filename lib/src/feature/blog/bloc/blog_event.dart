import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BlogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchedBlogStarted extends BlogEvent {}

class FetchedBlogByCategoryStarted extends BlogEvent {
  final String? id;
  FetchedBlogByCategoryStarted({@required this.id});
}

class FetchedBlogByIdStarted extends BlogEvent {
  final dynamic id;
  FetchedBlogByIdStarted({required this.id});
}
