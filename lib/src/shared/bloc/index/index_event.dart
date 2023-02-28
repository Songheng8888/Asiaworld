// import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class IndexEvent extends Equatable {
  IndexEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class Taped extends IndexEvent {
  Taped({required this.index}) : super([index]);
  final int index;
}
