import 'package:equatable/equatable.dart';

abstract class MarketTypeEvent extends Equatable {
  MarketTypeEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}


class FetchMarketTypeStarted extends MarketTypeEvent {}

