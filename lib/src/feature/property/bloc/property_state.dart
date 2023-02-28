import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/utils/share/app_constant.dart';

abstract class PropertyState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitailizingProperty extends PropertyState {}

class InitailizedProperty extends PropertyState {}

class FetchingProperty extends PropertyState {}

class FetchedProperty extends PropertyState {}

class RefreshingProperty extends PropertyState {}

class EndofPropertyList extends PropertyState {}

class ErrorFetchingProperty extends PropertyState with ErrorState {
  final dynamic error;
  ErrorFetchingProperty({required this.error});
}
