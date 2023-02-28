import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:royal_landapp/src/appLocalizations.dart';
import 'package:royal_landapp/src/feature/account/bloc/index.dart';
import 'package:royal_landapp/src/feature/auth/bloc/index.dart';
import 'package:royal_landapp/src/feature/landing/landing_page.dart';
import 'package:royal_landapp/src/feature/language/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:royal_landapp/src/feature/shop/bloc/index.dart';
import 'package:royal_landapp/src/feature/shop/screen/shop_item.dart';

import 'src/feature/login_register/bloc/otp/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) =>
                  AuthenticationBloc()..add(CheckingAuthenticationStarted())),
          BlocProvider<PropertyTypeBloc>(
              create: (BuildContext context) =>
                  PropertyTypeBloc()..add(FetchPropertyTypeStarted())),
          BlocProvider<ShopBloc>(
              create: (BuildContext context) => ShopBloc()..add(FetchShopStarted())),
          BlocProvider<PropertyBloc>(create: (BuildContext context) => PropertyBloc()),
          BlocProvider<LanguageBloc>(
              create: (BuildContext context) => LanguageBloc()..add(LanguageLoadStarted())),
          BlocProvider<AccountBloc>(create: (BuildContext context) => AccountBloc()),
          BlocProvider<VerifyOptBloc>(create: (BuildContext context) => VerifyOptBloc()),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: [Locale('en', 'US'), Locale('km', 'KH')],
              debugShowCheckedModeBanner: false,
              title: "Asia World",
              theme: ThemeData(primarySwatch: Colors.blue),
              home: LandingPage(),
              builder: EasyLoading.init(),
            );
          },
        ));
  }
}
