import 'package:DriveMe/services/rider_service.dart';
import 'package:flutter/material.dart';
//import 'Screens/HomeScreen.dart';
import 'Screens/SignInScreen.dart';
import 'Screens/SignUPScreen.dart';
import 'Screens/OTPscreen.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => RiderService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Screen ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: 'SignIn',
      routes: {
        'SignIn': (context) => SignInScreen(),
        'SignUp': (context) => SignUpScreen(),
        // 'Home': (context) => HomeScreen(),
        // 'phoneNum': (context) => SignUpScreen(),
        // 'OTP': (context) => newMethod(),
      },
    );
  }

  OTPscreen newMethod() => OTPscreen('String phone');
}
