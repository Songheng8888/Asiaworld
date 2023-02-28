import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/feature/auth/model/user_model.dart';

@immutable
abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class Initializing extends RegisterState {}

class Registered extends RegisterState {
  final UserModel userModel;
  Registered({required this.userModel});
}

class Registering extends RegisterState {}

class ErrorRegistering extends RegisterState {
  final dynamic error;
  ErrorRegistering({required this.error});
}
