import 'package:equatable/equatable.dart';

abstract class PropertyListingEvent extends Equatable {
  @override
  List<Object> get props => [];
  PropertyListingEvent();
}

class InitializeProductListingStarted extends PropertyListingEvent {
  final arg;
  InitializeProductListingStarted({this.arg});
}

class FetchPropertyListingStarted extends PropertyListingEvent {
  final arg;
  FetchPropertyListingStarted({required this.arg});
}

class RefreshPropertyListingStarted extends PropertyListingEvent {
  final arg;
  RefreshPropertyListingStarted({required this.arg});
}
