import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationState extends Equatable {
  final String token;
  @override
  List<Object> get props => [];
  AuthenticationState({required this.token});
}

class Initializing extends AuthenticationState {
  Initializing() : super(token: "");
}

class Authenticated extends AuthenticationState {
  final String token;
  Authenticated({required this.token}) : super(token: token);
}

class Authenticating extends AuthenticationState {
  Authenticating() : super(token: "");
}

class NotAuthenticated extends AuthenticationState {
  NotAuthenticated() : super(token: "");
}

class ErrorAuthentication extends AuthenticationState {
  ErrorAuthentication({@required this.error}) : super(token: "");
  final String? error;
}

class LoggingOut extends AuthenticationState {
  LoggingOut() : super(token: "");
}

class Loggedout extends AuthenticationState {
  Loggedout() : super(token: "");
}
