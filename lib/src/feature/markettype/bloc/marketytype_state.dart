import 'package:equatable/equatable.dart';

abstract class MarketTypeState extends Equatable {
  MarketTypeState([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}


class FetchingMarketType extends MarketTypeState {}

class FetchedMarketType extends MarketTypeState {}



class ErrorFetchingMarketType extends MarketTypeState {
  final dynamic error;
  ErrorFetchingMarketType({required this.error});
}

