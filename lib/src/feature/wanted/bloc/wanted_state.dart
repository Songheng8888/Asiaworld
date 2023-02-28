import 'package:equatable/equatable.dart';

abstract class WantedState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchingWanted extends WantedState {}

class FetchedWanted extends WantedState {}

class AddingWanted extends WantedState {}

class AddedWanted extends WantedState {}

class ErrorFetchingWanted extends WantedState {
  final dynamic error;
  ErrorFetchingWanted({required this.error});
}

class ErrorAddingWanted extends WantedState {
  final dynamic error;
  ErrorAddingWanted({required this.error});
}
