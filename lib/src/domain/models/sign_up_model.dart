import 'package:flutter/material.dart';

class SignUpModel {
  String? userId;
  TextEditingController childName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController doctorName = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();

  Map<String, dynamic> toJson() {
    final Map<String, String> data = <String, String>{};
    data['childName'] = childName.text;
    data['email'] = email.text;
    data['password'] = password.text;
    data['dateOfBirth'] = dateOfBirth.text;
    data['phone'] = phone.text;
    data['gender'] = gender.text;
    data['doctorName'] = doctorName.text;
    data['date'] = date.text;
    data['description'] = description.text;
    data['userId'] = userId.toString();
    data['level'] = "1";
    data['category'] = "1";
    data['test'] = "1";
    data['points'] = "0";
    data['levelProgress'] = "0.0";

    return data;
  }
}
