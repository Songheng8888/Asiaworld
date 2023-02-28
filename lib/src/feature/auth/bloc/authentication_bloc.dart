import 'package:royal_landapp/src/feature/auth/model/user_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/utils/service/storage.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Authenticating());

  Storage _storage = Storage();
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is CheckingAuthenticationStarted) {
      yield Initializing();
      UserModel? _user = await _storage.getCurrentUser();
      if (_user == null || _user.token == "") {
        yield NotAuthenticated();
      } else {
        ApiProvider.accessToken = _user.token;

        yield Authenticated(token: _user.token);
      }
    }
    if (event is AuthenticationStarted) {
      yield Authenticating();
      await _storage.saveCurrentUser(user: event.user);
      ApiProvider.accessToken = event.user.token;
      yield Authenticated(token: event.user.token);
    }
    if (event is LogoutPressed) {
      yield LoggingOut();
      await _storage.removeToken();
      ApiProvider.accessToken = "";
      await Future.delayed(Duration(seconds: 1));
      yield NotAuthenticated();
    }
  }
}
