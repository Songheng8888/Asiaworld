import 'package:equatable/equatable.dart';

abstract class VerifyOptEvent extends Equatable {
  VerifyOptEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class VerifyOptPressedStarted extends VerifyOptEvent {
  final dynamic ref;
  final dynamic text;
  final dynamic token;

  VerifyOptPressedStarted(
      {required this.ref, required this.text, required this.token});
}

class ResendVerifyOtpStarted extends VerifyOptEvent {
  final dynamic token;
  ResendVerifyOtpStarted({required this.token});
}
