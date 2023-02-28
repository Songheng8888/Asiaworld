import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/banner/bloc/banner_event.dart';
import 'package:royal_landapp/src/feature/banner/bloc/banner_state.dart';
import 'package:royal_landapp/src/feature/banner/model/model_banner.dart';
import 'package:royal_landapp/src/feature/banner/repository/banner_repository.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  List<BannerModel> banners = [];
  BannerRepository _appContentsRepository = BannerRepository();
  @override
  BannerBloc() : super(FetchingBanner());

  @override
  Stream<BannerState> mapEventToState(BannerEvent event) async* {
    if (event is FetchedBannerStarted) {
      yield FetchingBanner();
      try {
        banners.clear();
        await Future.delayed(Duration(milliseconds: 200));
        banners = await _appContentsRepository.getListBanner();

        yield FetchedBanner();
      } catch (e) {
        yield ErrorFetchingBanner(error: e.toString());
      }
    }
  }
}
