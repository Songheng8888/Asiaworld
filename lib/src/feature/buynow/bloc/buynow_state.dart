import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
@immutable
abstract class BuyNowState extends Equatable {
  BuyNowState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class AddingToBuyNow extends BuyNowState {}

class AddedToBuyNow extends BuyNowState {}

class ProccessingBuyNow extends BuyNowState {}

class ProccessedBuyNow extends BuyNowState {}

class ErrorBuyNow extends BuyNowState {
  ErrorBuyNow({required this.error});
  final dynamic error;
}

class FetchingBuyNow extends BuyNowState {}

class FetchedBuyNow extends BuyNowState {
  // final Cart cart;
  // FetchedBuyNow({required this.cart});
}

class ErrorFetchingBuyNow extends BuyNowState {
  ErrorFetchingBuyNow({required this.error});
  final dynamic error;
}

class CheckingOut extends BuyNowState {}

class CheckedOut extends BuyNowState {}

class ErrorCheckingOut extends BuyNowState {
  ErrorCheckingOut({required this.error});
  final dynamic error;
}

class BuyyingNow extends BuyNowState{}

class Bought extends BuyNowState{}

class ErrorBuynow extends BuyNowState{
  final String e;
  ErrorBuynow({required this.e});
}