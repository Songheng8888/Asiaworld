import 'package:royal_landapp/src/feature/login_register/bloc/otp/index.dart';
import 'package:bloc/bloc.dart';
import 'package:royal_landapp/src/feature/login_register/repository/verify_opt_repository.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';

class VerifyOptBloc extends Bloc<VerifyOptEvent, VerifyOtpState> {
  VerifyOptBloc() : super(VerifyingOtp());
  VerifyOptRepository verifyOptRepository = VerifyOptRepository();
  @override
  Stream<VerifyOtpState> mapEventToState(VerifyOptEvent event) async* {
    if (event is VerifyOptPressedStarted) {
      yield VerifyingOtp();
      try {
        ApiProvider.accessToken = event.token;
        await verifyOptRepository.verifyOpt(ref: event.ref, text: event.text);
        yield VerifiedOtp();
      } catch (e) {
        yield ErrorVerifyOtp(error: e.toString());
      }
    }
    if (event is ResendVerifyOtpStarted) {
      yield ResendingVerifyOtp();
      try {
        Future.delayed(Duration(milliseconds: 200));
        ApiProvider.accessToken = event.token;
        final String _ref =
            await verifyOptRepository.resendOtp(token: event.token);
        yield ResentVerifiedOpt(ref: _ref);
      } catch (e) {
        yield ErrorVerifyOtp(error: e.toString());
      }
    }
  }
}
