import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constatns.dart';

class MainUser with ChangeNotifier {
  String id;
  String fName;
  String lName;
  String email;
  String phone;
  String twitter;
  String avatarCode;
  String token;
  Image profileImage;

  MainUser(
      {this.fName,
      this.lName,
      this.email,
      this.phone = '',
      this.twitter = '',
      this.avatarCode = '',
      this.id,
      this.token});

  Future<bool> loginUser(String email, String password) async {
    var response = await post(Uri.parse(apiUrl + '/session'),
        body: {'email': email.trim(), 'password': password});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      this.email = email.toString();
      this.fName = data['user']['firstName'].toString();
      this.lName = data['user']['lastName'].toString();
      this.phone = data['user']['phoneNumber'].toString();
      this.avatarCode = data['user']['avatar'].toString();
      this.id = data['user']['id'].toString();
      profileImage = Image.memory(base64Decode(avatarCode));
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
