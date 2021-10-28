import 'package:flutter/foundation.dart'; // for the requird anotation tutorial...
import 'package:flutter/cupertino.dart'; // but i think this is what we need

class RiderInsert {
  String name;
  String gender;
  String country;
  // ignore: non_constant_identifier_names
  String phone_no;
  String dob;
  // ignore: non_constant_identifier_names
  String current_payement_type;
  // ignore: non_constant_identifier_names
  String current_payment_ac;

  RiderInsert({
    @required this.name,
    // ignore: non_constant_identifier_names
    @required this.phone_no,
    @required this.gender,
    @required this.country,
    @required this.dob,
    // ignore: non_constant_identifier_names
    @required this.current_payement_type,
    // ignore: non_constant_identifier_names
    @required this.current_payment_ac,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gender": gender,
      "country": country,
      "phone_no": phone_no,
      "dob": dob,
      "current_payment_type": current_payement_type,
      "current_payement_ac": current_payment_ac
    };
  }
}

/*
sample json file
*/

// {
//         "name": "Prabahth",
//         "gender": "male",
//         "country": "Srilanka",
//         "phone_no": "077477",
//         "dob": "2021-01-27",
//         "current_payment_type": "cash",
//         "current_payement_ac": "no"
//  }
