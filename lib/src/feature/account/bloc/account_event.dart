import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';

abstract class AccountEvent extends Equatable {
  AccountEvent([List props = const []]) : super();
  @override
  List<Object> get props => [];
}

class FetchAccountStarted extends AccountEvent {}

class SetAccount extends AccountEvent {
  final AccountModel user;
  SetAccount({required this.user});
}

class UpdateAccount extends AccountEvent {
  final File? imageFile;
  final AccountModel user;
  UpdateAccount({required this.user, required this.imageFile});
}

class UpdateAccountStated extends AccountEvent {
  final String name;
  final String phone;
  final File? imageUrl;
  final String email;
  final String city;
  final String company;
  final String address;
  final String skill;
  final String education;
  final String experience;

  // final String dob;

  UpdateAccountStated({
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.email,
    required this.city,
    required this.company,
    required this.address,
    required this.skill,
    required this.education,
    required this.experience
    // required this.dob,
  });
}

class UpgradeAccountStarted extends AccountEvent {
  // final String name;
  // final String phone;

  final String subscriptionId;
  final String paymentMethod;
  final File imageUrl;
  UpgradeAccountStarted(
      {
      // required this.name,
      // required this.phone,

      required this.subscriptionId,
      required this.paymentMethod,
      required this.imageUrl});
}
