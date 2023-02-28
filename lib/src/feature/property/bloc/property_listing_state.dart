import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/utils/share/app_constant.dart';

abstract class PropertyListingState extends Equatable {
  const PropertyListingState();

  @override
  List<Object> get props => [];
}

class InitializingProductListing extends PropertyListingState {}

class InitializedProductListing extends PropertyListingState {}

class FetchingPropertyListing extends PropertyListingState {}

class FetchedPropertyListing extends PropertyListingState {}

class EndOfPropertyListing extends PropertyListingState {}

class ErrorFetchingPropertyListing extends PropertyListingState {
  final dynamic error;
  ErrorFetchingPropertyListing({required this.error});
  @override
  String toString() => 'LoadingFavourite';
}

class ErrorInitializingProductListing extends PropertyListingState
    with ErrorState {
  final dynamic error;
  ErrorInitializingProductListing({required this.error});
  @override
  String toString() => 'LoadingFavourite';
}
