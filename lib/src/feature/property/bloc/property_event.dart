import 'package:equatable/equatable.dart';

abstract class PropertyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitailizepropertyByIdStarted extends PropertyEvent {
  final String id;
  final bool? isRefresh;
  InitailizepropertyByIdStarted({required this.id, this.isRefresh});
}

class FetchPropertyStarted extends PropertyEvent {}

class FetchPropertyByIdStarted extends PropertyEvent {
  final String id;
  FetchPropertyByIdStarted({required this.id});
}

class InitailizeRelatedStarted extends PropertyEvent {
  final String id;
  final bool? isRefresh;
  InitailizeRelatedStarted({required this.id, this.isRefresh});
}

class FetchRelatedStarted extends PropertyEvent {
  final String id;
  FetchRelatedStarted({required this.id});
}
