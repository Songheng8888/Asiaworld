import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:royal_landapp/src/feature/buynow/bloc/index.dart';
import 'package:royal_landapp/src/feature/buynow/repository/buynow_repository.dart';

class BuyNowBloc extends Bloc<BuyNowEvent, BuyNowState> {
  // BuyNowRepository _buyNowRepository = BuyNowRepository();
  @override
  BuyNowBloc() : super(FetchingBuyNow());
  BuyNowRepository _buyNowRepository = BuyNowRepository();

  @override
  Stream<BuyNowState> mapEventToState(BuyNowEvent event) async* {
    if (event is FetchBuyNow) {
      yield FetchingBuyNow();
      try {
        // Cart tempCart = await _buyNowRepository.getBuyNowCart(
        //     buyNowItem: event.buyNowItem!, addressId: event.addressId);
        // yield FetchedBuyNow(cart: tempCart);
      } catch (e) {
        yield ErrorFetchingBuyNow(error: e);
      }
    }

    if (event is BuyNowPress) {
      yield BuyyingNow();

      try {
        await _buyNowRepository.buynow(property_id: event.property_id);
        yield Bought();
      } catch (e) {
        yield ErrorBuynow(e: e.toString());
      }
    }
  }
}
