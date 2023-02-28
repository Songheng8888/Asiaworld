import 'package:equatable/equatable.dart';

abstract class PropertyTypeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPropertyTypeStarted extends PropertyTypeEvent {}

class RefreshPropertyTypStarted extends PropertyTypeEvent{
}
class FetchAllPropertyTypeStarted extends PropertyTypeEvent{
  
}

class GetCategoryDetail extends PropertyTypeEvent {
  final String id;
  GetCategoryDetail({required this.id});
}
