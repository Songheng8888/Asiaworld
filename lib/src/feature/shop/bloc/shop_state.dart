import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitailizingShop extends ShopState {}

class InitailizedShop extends ShopState {}

class FetchingShop extends ShopState {}

class EndofShopList extends ShopState {}

class FetchedShop extends ShopState {}

class ErrorFetchingShop extends ShopState {
  final dynamic error;
  ErrorFetchingShop({required this.error});
}
