// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:royal_landapp/src/feature/auth/bloc/auth_bloc.dart';
// import 'package:royal_landapp/src/feature/auth/bloc/index.dart';
// import 'package:royal_landapp/src/feature/login_register/register/screen/loging_register.dart';

// class RequireLogin extends StatelessWidget {
//   final Widget widget;
//   RequireLogin({required this.widget});
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//         builder: (context, state) {
//       if (state is NotAuthenticated) {
//         return LoginregisterPage();
//       }
//       return this.widget;
//     });
//   }
// }
