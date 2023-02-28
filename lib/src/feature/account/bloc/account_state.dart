import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';

class AccountState extends Equatable {
  AccountState([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class FethchingAccount extends AccountState {}

class FethedAccount extends AccountState {
//   final AccountModel user;
//   FethedAccount({required this.user});
}

class ErrorFethchingAccount extends AccountState {
  final String error;
  ErrorFethchingAccount({required this.error});
}

class UpdatingAccount extends AccountState {}

class UpdatedAccount extends AccountState {}

class UpgradingAccount extends AccountState{}

class UpgradedAccount extends AccountState{}

class ErrorUpdatingAccount extends AccountState {
  final dynamic error;
  ErrorUpdatingAccount({required this.error});
}
