import 'package:equatable/equatable.dart';

abstract class WantedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWantedStarted extends WantedEvent {}
class FetchMyWantedStarted extends WantedEvent {}
class AddWantedStarted extends WantedEvent {
  final String description;
  final String propertyTypeId;
  final String minPrice;
  final String maxPrice;
  final String contactNumber;
  final String marketTypeId;
  AddWantedStarted(
      {required this.description,
      required this.propertyTypeId,
      required this.minPrice,
      required this.maxPrice,
      required this.marketTypeId,
      required this.contactNumber});
}

class UpdateWantedStarted extends WantedEvent {
  final String id;
  final String description;
  final String propertyTypeId;
  final String minPrice;
  final String maxPrice;
  final String contactNumber;
  final String marketTypeId;
  UpdateWantedStarted(
      {required this.id,
      required this.description,
      required this.propertyTypeId,
      required this.minPrice,
      required this.maxPrice,
      required this.marketTypeId,
      required this.contactNumber});
}

class DeletedWantedStarted extends WantedEvent {
  final String id;
  DeletedWantedStarted({required this.id});
}
