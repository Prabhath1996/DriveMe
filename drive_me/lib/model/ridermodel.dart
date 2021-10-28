// To parse this JSON data, do
//
//     final ridermodel = ridermodelFromJson(jsonString);

import 'dart:convert';

Ridermodel ridermodelFromJson(String str) =>
    Ridermodel.fromJson(json.decode(str));

String ridermodelToJson(Ridermodel data) => json.encode(data.toJson());

class Ridermodel {
  Ridermodel({
    this.name,
    this.gender,
    this.country,
    this.phoneNo,
    this.dob,
    this.currentPaymentType,
    this.currentPayementAc,
  });

  String name;
  String gender;
  String country;
  String phoneNo;
  DateTime dob;
  String currentPaymentType;
  String currentPayementAc;

  factory Ridermodel.fromJson(Map<String, dynamic> json) => Ridermodel(
        name: json["name"],
        gender: json["gender"],
        country: json["country"],
        phoneNo: json["phone_no"],
        dob: json["dob"],
        currentPaymentType: json["current_payment_type"],
        currentPayementAc: json["current_payement_ac"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "country": country,
        "phone_no": phoneNo,
        "dob": dob,
        "current_payment_type": currentPaymentType,
        "current_payement_ac": currentPayementAc,
      };
}
