import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/property/repository/property_repository.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(InitailizingProperty());
  PropertyRepository _propertyRepository = PropertyRepository();
  List<PropertyModel> propertylist = [];
  List<PropertyModel> probyId = [];
  int page = 1;
  int rowperpage = 12;
  @override
  Stream<PropertyState> mapEventToState(PropertyEvent event) async* {
    if (event is InitailizepropertyByIdStarted) {
      yield InitailizingProperty();
      try {
        page = 1;
        probyId.clear();
        Future.delayed(Duration(milliseconds: 200));
        List<PropertyModel> _tempResult = await _propertyRepository
            .getPropertyById(page: page, rowperpage: rowperpage, id: event.id);
        probyId.addAll(_tempResult);
        page++;
        print(probyId.length);
        if (event.isRefresh == true) {
          yield FetchedProperty();
        } else {
          yield InitailizedProperty();
        }
      } catch (e) {
        yield ErrorFetchingProperty(error: e.toString());
      }
    }
    if (event is FetchPropertyByIdStarted) {
      yield FetchingProperty();
      try {
        Future.delayed(Duration(milliseconds: 200));

        List<PropertyModel> _tempResult = await _propertyRepository
            .getPropertyById(id: event.id, page: page, rowperpage: rowperpage);
        probyId.addAll(_tempResult);
        page++;
        if (_tempResult.length < rowperpage) {
          yield EndofPropertyList();
        } else {
          yield FetchedProperty();
        }
      } catch (e) {
        yield ErrorFetchingProperty(error: e.toString());
      }
    }
    if (event is FetchPropertyStarted) {
      yield FetchingProperty();
      try {
        List<PropertyModel> _tempResult = await _propertyRepository
            .getPropertyList(page: page, rowperpage: rowperpage);
        propertylist.addAll(_tempResult);
        page++;
        if (_tempResult.length < rowperpage) {
          yield EndofPropertyList();
        } else {
          yield FetchedProperty();
        }
      } catch (e) {
        yield ErrorFetchingProperty(error: e.toString());
      }
    }
    if (event is InitailizeRelatedStarted) {
      yield InitailizingProperty();
      try {
        page = 1;
        propertylist.clear();
        Future.delayed(Duration(milliseconds: 200));

        List<PropertyModel> _tempResult =
            await _propertyRepository.getRelatedPropertyList(
                id: event.id, rowperpage: rowperpage, page: page);
        propertylist.addAll(_tempResult);
        page++;
        if (event.isRefresh == true) {
          yield FetchedProperty();
        } else {
          yield InitailizedProperty();
        }
      } catch (e) {
        yield ErrorFetchingProperty(error: e.toString());
      }
    }
    if (event is FetchRelatedStarted) {
      yield FetchingProperty();
      try {
        Future.delayed(Duration(milliseconds: 200));

        List<PropertyModel> _tempResult =
            await _propertyRepository.getRelatedPropertyList(
                id: event.id, rowperpage: rowperpage, page: page);
        propertylist.addAll(_tempResult);
        page++;
        if (_tempResult.length < rowperpage) {
          yield EndofPropertyList();
        } else {
          yield FetchedProperty();
        }
      } catch (e) {
        yield ErrorFetchingProperty(error: e.toString());
      }
    }
  }
}
