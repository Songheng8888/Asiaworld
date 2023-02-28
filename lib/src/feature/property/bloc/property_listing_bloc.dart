import 'package:bloc/bloc.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/property/repository/property_listing_repository.dart';

import 'index.dart';

class PropertyListingBloc
    extends Bloc<PropertyListingEvent, PropertyListingState> {
  PropertyListingBloc(
      {required this.productListingRepository, this.rowPerPage = 10})
      : super(InitializingProductListing());
  final PropertyListingRepository productListingRepository;
  int page = 1;
  List<PropertyModel> productList = [];
  final int? rowPerPage;

  @override
  Stream<PropertyListingState> mapEventToState(
      PropertyListingEvent event) async* {
    if (event is InitializeProductListingStarted) {
      yield InitializingProductListing();
      try {
        page = 1;
        productList = await productListingRepository.getPropertyList(
            page: page, additionalArg: event.arg);
        page++;
        yield InitializedProductListing();
      } catch (e) {
        print(e.toString());
        yield ErrorInitializingProductListing(error: e.toString());
      }
    }
    if (event is FetchPropertyListingStarted) {
      yield FetchingPropertyListing();
      try {
        List<PropertyModel> _tempProductList = await productListingRepository
            .getPropertyList(page: page, additionalArg: event.arg);
        productList.addAll(_tempProductList);
        page++;
        if (_tempProductList.length < rowPerPage!) {
          yield EndOfPropertyListing();
        } else {
          yield FetchedPropertyListing();
        }
      } catch (e) {
        yield ErrorInitializingProductListing(error: e.toString());
      }
    }
    if (event is RefreshPropertyListingStarted) {
      yield FetchingPropertyListing();
      try {
        productList.clear();
        page = 1;
        List<PropertyModel> _tempProductList = await productListingRepository
            .getPropertyList(page: page, additionalArg: event.arg);
        productList.addAll(_tempProductList);
        page++;
        yield FetchedPropertyListing();
      } catch (e) {
        yield ErrorInitializingProductListing(error: e.toString());
      }
    }
  }
}
