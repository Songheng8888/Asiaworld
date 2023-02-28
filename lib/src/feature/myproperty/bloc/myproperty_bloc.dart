import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/repository/myproperty_repository.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';

class MyPropertyBloc extends Bloc<MyPropertyEvent, MyPropertyState> {
  MyPropertyBloc() : super(InitailizingMyProperty());
  MyPropertyRepository _repository = MyPropertyRepository();
  List<PropertyModel> myprolist = [];

  int page = 1;
  int rowperpage = 12;
  String myimg = "";
  String tcase = "";
  @override
  Stream<MyPropertyState> mapEventToState(MyPropertyEvent event) async* {
    if (event is InitilizeMyPropertyStarted) {
      yield InitailizingMyProperty();
      try {
        page = 1;
        myprolist.clear();
        Future.delayed(Duration(milliseconds: 200));

        List<PropertyModel> _tempResult = await _repository.getMyProperties(
            page: page, rowperpage: rowperpage);
        myprolist.addAll(_tempResult);
        print(myprolist.length);
        page++;
        if (event.isRefresh == true) {
          yield FetchedMyProperty();
        }
        yield InitailizedMyProperty();
      } catch (e) {
        log(e.toString());
        yield ErrorFetchingMyProperty(error: e.toString());
      }
    }

    if (event is FetchMyPropertyStarted) {
      yield FetchingMyProperty();
      try {
        Future.delayed(Duration(milliseconds: 200));

        print(myprolist.length);
        List<PropertyModel> _tempResult = await _repository.getMyProperties(
            page: page, rowperpage: rowperpage);
        myprolist.addAll(_tempResult);
        print(myprolist.length);
        page++;
        if (_tempResult.length < rowperpage) {
          yield EndofMyPropertyList();
        } else {
          yield FetchedMyProperty();
        }
      } catch (e) {
        log(e.toString());
        yield ErrorFetchingMyProperty(error: e.toString());
      }
    }

    if (event is AddMyPropertyStarted) {
      yield AddingMyProperty();
      try {
        final String _img = await uploadImage(image: event.imgUrl);
        print(_img);
        print(event.propertyType);
        await _repository.addMyproperty(
            propertyName: event.propertyName,
            propertyType: event.propertyType,
            projectId: event.projectId,
            marketId: event.marketId,
            propertyCode: event.propertyCode,
            propertyPrice: event.propertyPrice,
            propertyNo: event.propertyNo,
            address: event.address,
            street: event.street,
            lat: event.lat,
            long: event.long,
            village: event.village,
            commune: event.commune,
            district: event.district,
            province: event.province,
            img: _img);
        yield AddedMyProperty();
        yield FetchingMyProperty();
        myprolist.clear();
        page = 1;
        List<PropertyModel> _tempResult = await _repository.getMyProperties(
            page: page, rowperpage: rowperpage);
        myprolist.addAll(_tempResult);
        print(myprolist.length);
        page++;
        yield FetchedMyProperty();
      } catch (e) {
        print(e.toString());
        ErrorAddingMyProperty(error: e.toString());
      }
    }
    if (event is UpdateMyPropertyStarted) {
      yield AddingMyProperty();
      try {
        print(event.imgUrl);
        print(event.img);
        // print(object)
        // check img
        if (event.imgUrl != null && event.img == null || event.img == "") {
          myimg = await uploadImage(image: event.imgUrl!);
          tcase = "01";
          print("case $tcase");
        }
        if (event.imgUrl != null && event.img != null) {
          myimg = await uploadImage(image: event.imgUrl!);
          print(myimg);
          tcase = "02";
          // print(img);
          print("case $tcase");
        }
        if (event.imgUrl == null && event.img != null) {
          myimg = event.img!;
          tcase = "03";
          print("case $tcase");
        }
        print("image file ${event.imgUrl}");
        print("image from model ${event.img}");
        print("last image $myimg");
        print("case $tcase");
        await _repository.editMyproperty(
          id: event.id,
          propertyName: event.propertyName,
          propertyType: event.propertyType,
          projectId: event.projectId,
          marketId: event.makertId,
          propertyCode: event.propertyCode,
          propertyPrice: event.propertyPrice,
          propertyNo: event.propertyNo,
          address: event.address,
          street: event.street,
          lat: event.lat,
          long: event.long,
          img: myimg,
          village: event.village,
          commune: event.commune,
          district: event.district,
          province: event.province,
        );

        yield AddedMyProperty();
        yield FetchingMyProperty();
        myprolist.clear();
        page = 1;
        List<PropertyModel> _tempResult = await _repository.getMyProperties(
            page: page, rowperpage: rowperpage);
        myprolist.addAll(_tempResult);
        print(myprolist.length);
        page++;
        yield FetchedMyProperty();
      } catch (e) {
        print(e.toString());
        ErrorAddingMyProperty(error: e.toString());
      }
    }
    if (event is DeleteMyPropertyStarted) {
      yield AddingMyProperty();
      try {
        Future.delayed(Duration(milliseconds: 200));
        await _repository.deleteMyProperty(id: event.id);
        yield AddedMyProperty();
        yield FetchingMyProperty();
        myprolist.clear();
        page = 1;
        List<PropertyModel> _tempResult = await _repository.getMyProperties(
            page: page, rowperpage: rowperpage);
        myprolist.addAll(_tempResult);
        print(myprolist.length);
        page++;
        yield FetchedMyProperty();
      } catch (e) {
        ErrorAddingMyProperty(error: e.toString());
      }
    }
  }
}
