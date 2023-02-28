import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_event.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_state.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';
import 'package:royal_landapp/src/feature/account/repository/account_repository.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountRepository _accountRepository = AccountRepository();
  AccountModel? accountModel;

  @override
  AccountBloc() : super(FethchingAccount());
  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is FetchAccountStarted) {
      yield FethchingAccount();
      try {
        Future.delayed(Duration(microseconds: 200));
        accountModel = await _accountRepository.getAccount();
        yield FethedAccount();
      } catch (e) {
        yield ErrorFethchingAccount(error: e.toString());
      }
    }

    if (event is UpdateAccountStated) {
      yield UpdatingAccount();
      try {
        if (event.imageUrl == null) {
          await _accountRepository.updateAccount(
            name: event.name,
            phone: event.phone,
            email: event.email,
            city: event.city,
            company: event.company,
            address: event.address,
            skills: event.skill,
            educations: event.education,
            experiences: event.experience,
            // imageUrl: image
          );
        } else {
          final String image = await uploadImage(image: event.imageUrl!);
          print(image);
          await _accountRepository.updateAccount(
              name: event.name,
              phone: event.phone,
              email: event.email,
              city: event.city,
              company: event.company,
              address: event.address,
              skills: event.skill,
              educations: event.education,
              experiences: event.experience,
              imageUrl: image);
        }
        //event.user.image = imageUrl;
        //await _accountRepository.updateAccount(event.user);
        yield UpdatedAccount();
        yield FethchingAccount();
        accountModel = await _accountRepository.getAccount();
        yield FethedAccount();
      } catch (e) {
        yield ErrorUpdatingAccount(error: e.toString());
      }
    }
    if (event is UpgradeAccountStarted) {
      yield UpgradingAccount();
      try {
        final String image = await uploadImage(image: event.imageUrl);
        print(image);

        await _accountRepository.upgradeAccount(
            subscriptionId: event.subscriptionId,
            paymentMethod: event.paymentMethod,
            imageUrl: image);

        yield UpgradedAccount();
        yield FethchingAccount();
        accountModel = await _accountRepository.getAccount();
        yield FethedAccount();
      } catch (e) {
        print(e.toString());
        yield ErrorUpdatingAccount(error: e.toString());
      }
    }
  }
}
