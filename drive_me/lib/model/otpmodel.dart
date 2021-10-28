import 'dart:convert';

Otpmodel OtpmodelFromJson(String str) => Otpmodel.fromJson(json.decode(str));

String OtpmodelToJson(Otpmodel data) => json.encode(data.toJson());

class Otpmodel {
  Otpmodel({this.phone});

  String phone;

  factory Otpmodel.fromJson(Map<String, dynamic> json) => Otpmodel(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}
