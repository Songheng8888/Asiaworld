import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/subscription/bloc/index.dart';
import 'package:royal_landapp/src/feature/subscription/model/subscription_model.dart';
import 'package:royal_landapp/src/feature/subscription/repository/subscription_repository.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(FetchingSubscription());
  List<SubScriptionModel> sublist = [];
  SubscriptionRepository subscriptionRepository = SubscriptionRepository();
  @override
  Stream<SubscriptionState> mapEventToState(SubscriptionEvent event) async* {
    if (event is FetchedSubscriptionStarted) {
      yield FetchingSubscription();
      try {
        sublist = await subscriptionRepository.getListSubscription();
        yield FetchedSubscription();
      } catch (e) {
        yield ErrorFetchingSubscription(error: e);
      }
    }
  }
}
