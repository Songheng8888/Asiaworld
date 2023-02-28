import 'package:equatable/equatable.dart';


abstract class BuyNowEvent extends Equatable {
  BuyNowEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class AddToBuyNow extends BuyNowEvent {
  AddToBuyNow(
      {required this.productId,
      required this.variantId,
      required this.quantity});

  final String productId;
  final String variantId;
  final int quantity;
}

// class Increment extends BuyNowEvent {
//   Increment(
//       {@required this.cartId,
//       @required this.quantity,
//       @required this.accessToken});

//   final String cartId;
//   final int quantity;
//   final String accessToken;
// }
class SetQuantity extends BuyNowEvent {
  SetQuantity({
    required this.cartId,
    required this.quantity,
  });

  final String cartId;
  final int quantity;
}
// class Decrement extends BuyNowEvent {
//   Decrement(
//       {@required this.cartId,
//       @required this.quantity,
//       @required this.accessToken});

//   final String cartId;
//   final int quantity;
//   final String accessToken;
// }

class RemoveFromBuyNow extends BuyNowEvent {
  RemoveFromBuyNow({required this.cartId});

  final String cartId;
}

// ignore: must_be_immutable
class FetchBuyNow extends BuyNowEvent {
  
}

class LogoutBuyNow extends BuyNowEvent {}


class BuyNowPress extends BuyNowEvent{
  final int property_id;
  BuyNowPress({required this.property_id});
}