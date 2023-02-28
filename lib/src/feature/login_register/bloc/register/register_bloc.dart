import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:royal_landapp/src/feature/auth/model/user_model.dart';
import 'package:royal_landapp/src/feature/login_register/repository/login_register_repositories.dart';

import 'package:royal_landapp/src/utils/share/helper.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  LoginRegisterRepository _loginRegisterRepository = LoginRegisterRepository();
  @override
  RegisterBloc() : super(Initializing());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterPressed) {
      yield Registering();
      try {
        Future.delayed(Duration(milliseconds: 200));
        String _phoneNummber =
            Helper.convertToKhmerPhoneNumber(number: event.phoneNumber);
        final UserModel userModel = await _loginRegisterRepository.register(
            email: event.email,
            name: event.name,
            phoneNumber: _phoneNummber,
            password: event.password);

        yield Registered(userModel: userModel);
      } catch (e) {
        yield ErrorRegistering(error: e);
      }
    }
  }
}
