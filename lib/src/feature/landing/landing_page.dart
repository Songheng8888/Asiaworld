import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/auth/bloc/index.dart';

import 'package:royal_landapp/src/feature/home/screen/home.dart';
import 'package:royal_landapp/src/feature/login_register/screens/login_register_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
   Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print(message.data.toString());
    
  }

  initNotification() async {
    Firebase.initializeApp().then((value) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging.requestPermission();
      messaging.subscribeToTopic("all").then((value) {
        messaging
            .setForegroundNotificationPresentationOptions(
                alert: true, badge: true, sound: true)
            .then((value) {
          String? token;

          messaging.getToken().then((value) {
            token = value;
            print("token" + token.toString());
            FirebaseMessaging.instance.getInitialMessage().then((message) {
              print("FirebaseMessaging.getInitialMessage");
              if (message != null) {
                print(message);
              
              }
            });
            FirebaseMessaging.onBackgroundMessage(
                firebaseMessagingBackgroundHandler);
            FirebaseMessaging.onMessage.listen((RemoteMessage message) {
              print("hi");
            
            });

            FirebaseMessaging.onMessageOpenedApp
                .listen(firebaseMessagingBackgroundHandler);
          });
        });
      }); 
    });
  }

  @override
  void initState() {
    initNotification();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated) {
        print(state.token);
        return Home();
      }
      if (state is NotAuthenticated) {
        
        return LoginRegisterPage();
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
