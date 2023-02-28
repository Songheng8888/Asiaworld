import 'package:bloc/bloc.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:royal_landapp/src/feature/propertytype/repositories/propertytype_repository.dart';

class PropertyTypeBloc extends Bloc<PropertyTypeEvent, PropertyTypeState> {
  PropertyTypeBloc() : super(FetchingPropertyType());
  PropertyTypeRepository propertyTypeRepository = PropertyTypeRepository();
  List<PropertyTypeModel> propertytypelist = [];
  // List<CategoryDetailModel> categoryDetail = [];

  @override
  Stream<PropertyTypeState> mapEventToState(PropertyTypeEvent event) async* {
    if (event is FetchPropertyTypeStarted) {
      yield FetchingPropertyType();
      try {
        propertytypelist = await propertyTypeRepository.getPropertyTypeList();
        yield FetchedPropertyType();
      } catch (e) {
        yield ErrorFetchingPropertyType(error: e);
      }
    }
    if (event is FetchAllPropertyTypeStarted) {
      yield FetchingAllPropertyType();
      try {
        propertytypelist.clear();
        propertytypelist = await propertyTypeRepository.getPropertyTypeList();
        yield FetchedAllPropertyType();
      } catch (e) {
        yield ErrorFetchingPropertyType(error: e);
      }
    }
    if (event is RefreshPropertyTypStarted) {
      yield RefreshingPropertyType();
      try {
        if (propertytypelist.length != 0) {
          propertytypelist.clear();
        }
        print(propertytypelist.length);
        propertytypelist = await propertyTypeRepository.getPropertyTypeList();
        yield RefreshedPropertyType();
      } catch (e) {
        yield ErrorFetchingPropertyType(error: e);
      }
    }
  }
}
