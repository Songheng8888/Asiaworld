import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/wanted/bloc/index.dart';
import 'package:royal_landapp/src/feature/wanted/model/wanted_model.dart';
import 'package:royal_landapp/src/feature/wanted/repository/wanted_repository.dart';

class WantedBloc extends Bloc<WantedEvent, WantedState> {
  WantedBloc() : super(FetchingWanted());
  WantedRepository _wantedRepository = WantedRepository();
  List<WantedModel> wantedList = [];
  int page = 1;
  @override
  Stream<WantedState> mapEventToState(WantedEvent event) async* {
    if (event is FetchWantedStarted) {
      yield FetchingWanted();
      try {
        wantedList.clear();
        Future.delayed(Duration(milliseconds: 200));
        page = 1;
        print(wantedList.length);
        List<WantedModel> _tempResult =
            await _wantedRepository.getWantedList(page: page);
        wantedList.addAll(_tempResult);
        print(wantedList.length);
        page++;
        yield FetchedWanted();
      } catch (e) {
        yield ErrorFetchingWanted(error: e.toString());
      }
    }
    if (event is FetchMyWantedStarted) {
      yield FetchingWanted();
      try {
        if(wantedList.length !=0){
           wantedList.clear();
        }
       
        Future.delayed(Duration(milliseconds: 200));
        page = 1;
        print(wantedList.length);
        List<WantedModel> _tempResult =
            await _wantedRepository.getMyWantedList(page: page);
        wantedList.addAll(_tempResult);
        print(wantedList.length);
        page++;
        yield FetchedWanted();
      } catch (e) {
        yield ErrorFetchingWanted(error: e.toString());
      }
    }
    if (event is AddWantedStarted) {
      yield AddingWanted();
      try {
        Future.delayed(Duration(milliseconds: 200));
        await _wantedRepository.addWanted(
            description: event.description,
            propertyTypeId: event.propertyTypeId,
            minPrice: event.minPrice,
            maxPrice: event.maxPrice,
            contactNumber: event.contactNumber,
            marketTypeId: event.marketTypeId);
        yield AddedWanted();
      } catch (e) {
        print(e.toString());
        yield ErrorAddingWanted(error: e.toString());
      }
    }
    if (event is UpdateWantedStarted) {
      yield AddingWanted();
      try {
        Future.delayed(Duration(milliseconds: 200));
        await _wantedRepository.editWanted(
            id: event.id,
            description: event.description,
            propertyTypeId: event.propertyTypeId,
            minPrice: event.minPrice,
            maxPrice: event.maxPrice,
            contactNumber: event.contactNumber,
            marketTypeId: event.marketTypeId);
        yield AddedWanted();
      } catch (e) {
        yield ErrorAddingWanted(error: e.toString());
      }
    }
    if (event is DeletedWantedStarted) {
      yield AddingWanted();
      try {
        Future.delayed(Duration(milliseconds: 200));
        await _wantedRepository.deleteWanted(id: event.id);
        yield AddedWanted();
      } catch (e) {
        yield ErrorAddingWanted(error: e.toString());
      }
    }
  }
}
