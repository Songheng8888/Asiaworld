import 'package:equatable/equatable.dart';

class ShopEvent extends Equatable {
  ShopEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class InitailizeShopStarted extends ShopEvent {
  final bool isRefresh;
  InitailizeShopStarted({required this.isRefresh});
}

class FetchShopStarted extends ShopEvent {}
