import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';

class OTPscreen extends StatelessWidget {
  // This widget is the root of your application.

  final String phoneNo;
  // String _verificationCode;
  OTPscreen(this.phoneNo);

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {  
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  void moveToNextScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SuccessfulOtpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Builder(builder: (_) {
      // if (_isLoading) {
      //   return Center(child: CircularProgressIndicator());
      // }

      // if (_apiResponse.error) {
      //   // return Center(child: Text(_apiResponse.errorMessage));
      // }
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OtpScreen.withGradientBackground(
          topColor: Color.fromRGBO(139, 240, 206, 1),
          bottomColor: Color.fromRGBO(75, 227, 176, 1),
          otpLength: 4,
          validateOtp: validateOtp,
          routeCallback: moveToNextScreen,
          themeColor: Colors.white,
          titleColor: Colors.white,
          title: "Phone Number Verification",
          subTitle: "Enter the code sent to \n " + phoneNo + "",
          icon: Image.asset(
            'asset/img/logo.png',
            fit: BoxFit.fill,
          ),
        ),
      );
    });
  }
}

class SuccessfulOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            "Otp verification successful",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
