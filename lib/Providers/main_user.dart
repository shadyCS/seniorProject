import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constatns.dart';

class MainUser with ChangeNotifier {
  String id = '1';
  String fName = 'Shadi';
  String lName = 'Aldahmees';
  String email = 'dj.shadow2017@outlook.com';
  String phone = '0565624322';
  String twitter;
  String headline;
  String avatarCode =
      'iVBORw0KGgoAAAANSUhEUgAAA0gAAANbCAYAAAB4pb/uAAAABmJLR0QA/wD/AP+gvaeTAACAAElEQVR42uy9e3Cb13nn/8X9fiEIQhAEUTBNUXdalhVFoyiKfI3rpo7jZr2pkzqtJ5u2qdvN7GZ2Z7PbTmY3v7aTdjPdbJsm3W3iybZpxuNxndRxXcdxFFdVFEWhaVmWKJmiYRiGIBDE/Y4XwO8P6Tl58RIAARKkQOn5zGhsiSDwxXnfc97znOemajQaDfSRVCqFfr2lSqWC0+kE62N9N4o+HkPWx/p4DFkf6+OxZH2sb7DnihYA+mkjNRqNvr9fP2F9rK/X91OpVDxHWB/r4znC+ljfivXxXGF9rG99zBU1GIZhGIZhGIZhGABsIDEMwzAMwzAMwwjYQGIYhmEYhmEYhrkGG0gMwzAMwzAMwzDXYAOJYRiGYRiGYRjmGmwgMQzDMAzDMAzDXIMNJIZhGIZhGIZhmGuwgcQwDMMwDMMwDHMNNpAYhmEYhmEYhmGuwQYSwzAMwzAMwzDMNdhAYhiGYRiGYRiGuQYbSAzDMAzDMAzDMNdgA4lhGIZhGIZhGOYabCAxDMMwDMMwDMNcY6ANJJVKhUajwfpYH+vjMWR9rI/HkPWxPh5L1sf61oSBNpAajQZUKhXrY32sj8eQ9bE+HkPWx/p4LFkf';
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjE3ODMxNjQ3LCJleHAiOjE2MTc5MTgwNDd9.7a-QTZTLDiVf1pL7Wga4F0tTzWhWJDAcIe6J6YoKuIw';
  Image profileImage = Image.memory(base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAA0gAAANbCAYAAAB4pb/uAAAABmJLR0QA/wD/AP+gvaeTAACAAElEQVR42uy9e3Cb13nn/8X9fiEIQhAEUTBNUXdalhVFoyiKfI3rpo7jZr2pkzqtJ5u2qdvN7GZ2Z7PbTmY3v7aTdjPdbJsm3W3iybZpxuNxndRxXcdxFFdVFEWhaVmWKJmiYRiGIBDE/Y4XwO8P6Tl58RIAARKkQOn5zGhsiSDwxXnfc97znOemajQaDfSRVCqFfr2lSqWC0+kE62N9N4o+HkPWx/p4DFkf6+OxZH2sb7DnihYA+mkjNRqNvr9fP2F9rK/X91OpVDxHWB/r4znC+ljfivXxXGF9rG99zBU1GIZhGIZhGIZhGABsIDEMwzAMwzAMwwjYQGIYhmEYhmEYhrkGG0gMwzAMwzAMwzDXYAOJYRiGYRiGYRjmGmwgMQzDMAzDMAzDXIMNJIZhGIZhGIZhmGuwgcQwDMMwDMMwDHMNNpAYhmEYhmEYhmGuwQYSwzAMwzAMwzDMNdhAYhiGYRiGYRiGuQYbSAzDMAzDMAzDMNdgA4lhGIZhGIZhGOYabCAxDMMwDMMwDMNcY6ANJJVKhUajwfpYH+vjMWR9rI/HkPWxPh5L1sf61oSBNpAajQZUKhXrY32sj8eQ9bE+HkPWx/p4LFkf'));

  // MainUser(
  //     {this.fName = '',
  //     this.lName = '',
  //     this.email = '',
  //     this.phone = '',
  //     this.twitter = '',
  //     this.avatarCode = '',
  //     this.id = '',
  //     this.token = ''});

  Future<bool> loginUser(String email, String password) async {
    var response = await post(Uri.parse(apiUrl + '/session'),
        body: {'email': email.trim(), 'password': password});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
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

  Future<void> changeInfo(String key, String newInfo) async {
    var response = await patch(
      Uri.parse(apiUrl + '/users'),
      headers: {'Authorization': 'BEARER $token'},
      body: {key: newInfo},
    );
    print(response.body);
    if (response.statusCode == 200) {
      switch (key) {
        case 'firstName':
          fName = newInfo;
          break;
        case 'lastName':
          lName = newInfo;
          break;
        case 'phoneNumber':
          phone = newInfo;
          break;
        case 'headline':
          headline = newInfo;
          break;
        case 'twitter':
          twitter = newInfo;
          break;
      }
      notifyListeners();
    }
  }

  Future<void> changeEmailOrPassword(String key, String newValue) async {
    var response = await put(
      Uri.parse(apiUrl + '/users'),
      headers: {'Authorization': 'BEARER $token'},
      body: {key: newValue},
    );
    print(response.body);
    if (response.statusCode == 200) {
      if (key == 'email') {
        email = newValue;
      }
      notifyListeners();
    }
  }
}
