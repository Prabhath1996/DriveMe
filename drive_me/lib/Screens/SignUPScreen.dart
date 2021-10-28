import 'package:DriveMe/model/otpmodel.dart';
//import 'package:DriveMe/model/rider_insert.dart';
import 'package:DriveMe/services/rider_service.dart';
import 'package:DriveMe/services/otp_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RiderService get riderService => GetIt.I<RiderService>();
  OTPService get otpservice => GetIt.I<OTPService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final _phoneControler = TextEditingController();
  final _nameControler = TextEditingController();
  String phoneno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""), //appbar title
        backgroundColor: Color.fromRGBO(75, 227, 176, 1), //appbar color
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'Enter your personal information',
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/img/logo.png'))),
              ),
              Container(
                  margin: EdgeInsets.only(right: 5, left: 20),
                  child: TextField(
                    controller: _phoneControler,
                    decoration: InputDecoration(hintText: 'Number'),
                  )),
              Container(
                  //     child: IntlPhoneField(
                  //   controller: _phoneControler,
                  //   decoration: InputDecoration(
                  //     //decoration for Input Field

                  //     labelText: 'Phone Number',
                  //   ),
                  //   initialCountryCode: 'LK', //default contry code, NP for Nepal
                  //   onChanged: (phone) {
                  //     //when phone number country code is changed
                  //     print(phone.completeNumber); //get complete number
                  //     print(phone.countryCode); // get country code only
                  //     print(phone.number); // only phone number
                  //     // final phone = _phoneControler.text.trim();
                  //     phoneno = phone.completeNumber;
                  //   },
                  // )
                  ),
              Container(
                margin:
                    EdgeInsets.only(top: 20), //make submit button 100% width

                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      final otp = Otpmodel(
                        phone: "7742485825",
                      );
                      final result = await otpservice.genarateOTP(otp);

                      final title = 'Done';
                      String text = result.error
                          ? (result.errorMessage ?? 'An error occurred otp not work')
                          : 'OTP was created';

                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(title),
                                content: Text(text),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('oky'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              )).then((data) {});
                    },
                    color: Color.fromRGBO(78, 228, 178, 1),
                    child: Text("Next"),
                    colorBrightness: Brightness.dark,
                    //backgroud color is darker so its birghtness
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('asset/img/signin.png'))),
      child: Positioned(
          child: Stack(
        children: <Widget>[
          Positioned(
              top: 20,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )
        ],
      )),
    );
  }
}
