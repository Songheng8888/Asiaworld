import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/feature/auth/model/user_model.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class Initializing extends LoginState {}

class Logged extends LoginState {
  final UserModel userModel;
  Logged({required this.userModel});
}

class Logging extends LoginState {}

class ErrorLogin extends LoginState {
  final dynamic error;
  ErrorLogin({@required this.error});
}
