import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class MyPropertyEvent extends Equatable {
  MyPropertyEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class InitilizeMyPropertyStarted extends MyPropertyEvent {
  final bool isRefresh;
  InitilizeMyPropertyStarted({required this.isRefresh});
}

class RefreshMyPropertyStarted extends MyPropertyEvent {}

class FetchMyPropertyStarted extends MyPropertyEvent {}

class AddMyPropertyStarted extends MyPropertyEvent {
  final String propertyName;
  final String propertyType;
  final String projectId;
  final String marketId;
  final String propertyCode;
  final String propertyPrice;
  final String propertyNo;
  final String address;
  final String street;
  final String lat;
  final String long;
  final String village;
  final String commune;
  final String district;
  final String province;
  final File imgUrl;

  AddMyPropertyStarted({
    required this.propertyName,
    required this.propertyType,
    required this.projectId,
    required this.marketId,
    required this.propertyCode,
    required this.propertyPrice,
    required this.propertyNo,
    required this.address,
    required this.street,
    required this.lat,
    required this.long,
    required this.village,
    required this.commune,
    required this.district,
    required this.province,
    required this.imgUrl,
  });
}

class UpdateMyPropertyStarted extends MyPropertyEvent {
  final String id;
  final String propertyName;
  final String propertyType;
  final String projectId;
  final String makertId;
  final String propertyCode;
  final String propertyPrice;
  final String propertyNo;
  final String address;
  final String street;
  final String lat;
  final String long;
  final String village;
  final String commune;
  final String district;
  final String province;
  final File? imgUrl;
  final String? img;
  // List<File> img;
  UpdateMyPropertyStarted(
      {required this.id,
      required this.propertyName,
      required this.propertyType,
      required this.projectId,
      required this.makertId,
      required this.propertyCode,
      required this.propertyPrice,
      required this.propertyNo,
      required this.address,
      required this.street,
      required this.lat,
      required this.long,
      required this.village,
      required this.commune,
      required this.district,
      required this.province,
      required this.img,
      required this.imgUrl});
}

class DeleteMyPropertyStarted extends MyPropertyEvent {
  final String id;
  DeleteMyPropertyStarted({required this.id});
}
