import 'dart:convert';

import 'package:DriveMe/model/api_response.dart';
import 'package:DriveMe/model/otpmodel.dart';
//import 'package:DriveMe/model/rider_insert.dart';
import 'package:http/http.dart' as http;

class OTPService {
  // ignore: slash_for_doc_comments
  /**
   * main rest url api
  **/
  static const API = 'https://serviceme2.herokuapp.com/';

  /* main  header file */
  static const headers = {
    // 'apiKey': '5433326b-743c-4f7e-966f-56e7145969a4',                 //api key
    'Content-Type': 'application/json',
  };

  // ignore: slash_for_doc_comments
  /** 
     *insert new otp
     */
  Future<APIResponse<bool>> genarateOTP(Otpmodel item) {
    return http
        .post(API + 'SME/api/users/getOtp', headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
