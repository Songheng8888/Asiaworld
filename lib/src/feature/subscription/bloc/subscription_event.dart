import 'package:equatable/equatable.dart';

abstract class SubscriptionEvent extends Equatable {
  SubscriptionEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchedSubscriptionStarted extends SubscriptionEvent {}
