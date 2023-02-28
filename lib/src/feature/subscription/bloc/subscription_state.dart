import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SubscriptionState extends Equatable {
  SubscriptionState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchingSubscription extends SubscriptionState {}

class FetchedSubscription extends SubscriptionState {}

class ErrorFetchingSubscription extends SubscriptionState {
  final dynamic error;
  ErrorFetchingSubscription({required this.error});
}
