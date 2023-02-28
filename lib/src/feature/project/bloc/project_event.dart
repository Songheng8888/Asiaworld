import 'package:equatable/equatable.dart';

abstract class ProjectEvent extends Equatable {
  ProjectEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class FetchProjectStarted extends ProjectEvent {}
