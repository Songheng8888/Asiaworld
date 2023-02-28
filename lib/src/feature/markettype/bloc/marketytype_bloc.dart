import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/markettype/bloc/index.dart';
import 'package:royal_landapp/src/feature/markettype/bloc/marketytype_event.dart';
import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/feature/markettype/repository/markety_type_repository.dart';

class MarketTypeBloc extends Bloc<MarketTypeEvent, MarketTypeState> {
  MarketTypeBloc() : super(FetchingMarketType());
  MarketTypeRepository marketTypeRepository = MarketTypeRepository();
  List<MarketTypeModel> makert = [];
  @override
    Stream<MarketTypeState> mapEventToState(MarketTypeEvent event) async*{
      if(event is FetchMarketTypeStarted){
        yield FetchingMarketType();
      try {
        Future.delayed(Duration(milliseconds: 200));
        makert = await marketTypeRepository.getMarketType();
        print(makert.length);
        yield FetchedMarketType();
      } catch (e) {
        yield ErrorFetchingMarketType(error: e.toString());
      }
      }
    }
}
