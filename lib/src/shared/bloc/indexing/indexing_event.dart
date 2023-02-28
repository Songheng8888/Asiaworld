import 'package:equatable/equatable.dart';

abstract class IndexingEvent extends Equatable {
  IndexingEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class Tapped extends IndexingEvent {
  Tapped({required this.index}) : super([index]);
  final int index;
}
