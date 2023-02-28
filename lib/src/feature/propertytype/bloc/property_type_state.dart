import 'package:equatable/equatable.dart';

abstract class PropertyTypeState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchingPropertyType extends PropertyTypeState {}

// ignore: must_be_immutable
class FetchedPropertyType extends PropertyTypeState {}
class FetchingAllPropertyType extends PropertyTypeState{}
class FetchedAllPropertyType extends PropertyTypeState{}
class RefreshingPropertyType extends PropertyTypeState {}
class RefreshedPropertyType extends PropertyTypeState {}

class ErrorFetchingPropertyType extends PropertyTypeState {
  final dynamic error;
  ErrorFetchingPropertyType({required this.error});
}

