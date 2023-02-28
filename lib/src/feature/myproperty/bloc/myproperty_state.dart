import 'package:equatable/equatable.dart';

abstract class MyPropertyState extends Equatable {
  MyPropertyState([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class InitailizingMyProperty extends MyPropertyState {}

class InitailizedMyProperty extends MyPropertyState {}

class FetchingMyProperty extends MyPropertyState {}

class FetchedMyProperty extends MyPropertyState {}

class EndofMyPropertyList extends MyPropertyState {}

class AddingMyProperty extends MyPropertyState {}

class AddedMyProperty extends MyPropertyState {}

class ErrorFetchingMyProperty extends MyPropertyState {
  final dynamic error;
  ErrorFetchingMyProperty({required this.error});
}

class ErrorAddingMyProperty extends MyPropertyState {
  final dynamic error;
  ErrorAddingMyProperty({required this.error});
}
