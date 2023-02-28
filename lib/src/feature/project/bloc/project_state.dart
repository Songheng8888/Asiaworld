import 'package:equatable/equatable.dart';

abstract class ProjectState extends Equatable {
  ProjectState([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class FetchingProject extends ProjectState {}

class FetchedProject extends ProjectState {}

class ErrorFetchingProject extends ProjectState {
  final dynamic error;
  ErrorFetchingProject({required this.error});
}
