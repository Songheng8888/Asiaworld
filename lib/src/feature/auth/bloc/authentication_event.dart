import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/feature/auth/model/user_model.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckingAuthenticationStarted extends AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {
  final UserModel user;
  final String token;
  AuthenticationStarted({required this.user, required this.token});
}

class LogoutPressed extends AuthenticationEvent {}
