import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:rorida_task/optionPage.dart';
import 'package:rorida_task/profilePage.dart';
import 'package:rorida_task/signIn.dart';
import 'package:rorida_task/signUp.dart';
import 'package:rorida_task/splashScreen.dart';
import 'package:rorida_task/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RoridaTask());
}

class RoridaTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        initialRoute: SplashPage.routeName,
        title: "Rorida-Task: Jainam",
        routes: {
          SplashPage.routeName: (BuildContext context) => SplashPage(),
          WelcomePage.routeName: (BuildContext context) => WelcomePage(),
          OptionPage.routeName: (BuildContext context) => OptionPage(),
          SignUpPage.routeName: (BuildContext context) => SignUpPage(),
          SignInPage.routeName: (BuildContext context) => SignInPage(),
          ProfilePage.routeName: (BuildContext context) => ProfilePage(),
        },
        debugShowCheckedModeBanner: false,
    );
  }
}
