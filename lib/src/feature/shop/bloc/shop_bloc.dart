import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/shop/bloc/index.dart';
import 'package:royal_landapp/src/feature/shop/model/shop_model.dart';
import 'package:royal_landapp/src/feature/shop/repository/shop_repository.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(InitailizingShop());
  ShopReppsitory companyReppsitory = ShopReppsitory();
  List<ShopModel> companyModel = [];
  int page = 1;
  int rowperpage = 12;
  @override
  Stream<ShopState> mapEventToState(ShopEvent event) async* {
    if (event is InitailizeShopStarted) {
      yield InitailizedShop();
      try {
        page = 1;
        companyModel.clear();
        List<ShopModel> _temList =
            await companyReppsitory.getShop(page: page, rowperpage: rowperpage);
        companyModel.addAll(_temList);
        page++;
        if (event.isRefresh == true) {
          yield FetchedShop();
        } else {
          yield InitailizedShop();
        }
      } catch (e) {
        yield ErrorFetchingShop(error: e.toString());
      }
    }
    if (event is FetchShopStarted) {
      yield FetchingShop();
      try {
        List<ShopModel> _temList =
            await companyReppsitory.getShop(page: page, rowperpage: rowperpage);
        companyModel.addAll(_temList);
        page++;
        if (_temList.length < rowperpage) {
          yield EndofShopList();
        } else {
          yield FetchedShop();
        }
      } catch (e) {
        yield ErrorFetchingShop(error: e.toString());
      }
    }
  }
}
