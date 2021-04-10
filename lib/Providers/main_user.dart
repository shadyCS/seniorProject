import 'dart:convert';
import 'dart:io';
import 'package:final_t_and_t/Providers/post.dart';
import 'package:final_t_and_t/Providers/user.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

import '../constatns.dart';

class MainUser with ChangeNotifier {
  String id;
  String fName;
  String lName;
  String email;
  String phone;
  String twitter;
  String headline;
  String avatarCode;
  String token;
  Image profileImage;
  String rating;
  String price;
  String joinDate;

  MainUser(
      {this.fName = '',
      this.lName = '',
      this.email = '',
      this.phone = '',
      this.twitter = '',
      this.avatarCode = '',
      this.id = '',
      this.token = ''});

  Future<String> loginUser(String email, String password) async {
    var response = await post(Uri.parse(apiUrl + '/session'),
        body: {'email': email.trim(), 'password': password});
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      this.email = email.toString();
      this.fName = data['user']['firstName'].toString();
      this.lName = data['user']['lastName'].toString();
      this.phone = data['user']['phoneNumber'].toString();
      this.headline = data['user']['headline'].toString();
      this.twitter = data['user']['twitter'].toString();
      this.avatarCode = data['user']['avatar'].toString();
      this.id = data['user']['id'].toString();
      this.token = data['token'].toString();
      profileImage = Image.memory(base64Decode(avatarCode));
      getInfo();
      notifyListeners();
      return 'Success';
    } else {
      return data['error'];
    }
  }

  Future<void> changeInfo(String key, String newInfo) async {
    var response = await patch(
      Uri.parse(apiUrl + '/users'),
      headers: {'Authorization': 'BEARER $token'},
      body: {key: newInfo},
    );
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
    if (response.statusCode == 200) {
      if (key == 'email') {
        email = newValue;
      }
      notifyListeners();
    }
  }

  upload(File imageFile) async {
    try {
      var stream = new ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var uri = Uri.parse(apiUrl + '/users/avatar');
      var request = new MultipartRequest("PATCH", uri);
      request.headers.addAll({"Authorization": "BEARER $token"});
      var multipartFile = new MultipartFile('avatar', stream, length,
          filename: basename(imageFile.path));
      //contentType: new MediaType('image', 'png'));
      request.files.add(multipartFile);
      var response = await request.send();
      if (response.statusCode == 200) {
        getInfo();
      }
    } catch (ex) {}
  }

  Future<void> getInfo() async {
    try {
      var response = await get(
        Uri.parse(apiUrl + '/users/$id'),
        headers: {'Authorization': 'BEARER $token'},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        this.email = data['user']['email'].toString();
        this.fName = data['user']['firstName'].toString();
        this.lName = data['user']['lastName'].toString();
        this.phone = data['user']['phoneNumber'].toString();
        this.headline = data['user']['headline'].toString();
        this.twitter = data['user']['twitter'].toString();
        this.avatarCode = data['user']['avatar'].toString();
        this.price = data['user']['price'].toString();
        this.rating = data['user']['rating'].toString();
        this.joinDate = data['user']['joinDate'].toString().split('T')[0];
        profileImage = Image.memory(base64Decode(avatarCode));
        notifyListeners();
      }
    } catch (ex) {}
  }

  Future<bool> rateUser(User user, int rating) async {
    print(user.id);
    var client = Client();
    var map = jsonEncode({'rating': rating});
    print(map);
    var response = await client.post(
      Uri.encodeFull(apiUrl + '/users/${user.id.toString()}/rating'),
      headers: {
        'Authorization': 'BEARER $token',
        'Content-Type': 'application/json'
      },
      body: map,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      user.isRated = true;
      notifyListeners();
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<String> createPost(Post postContent) async {
    var response = await post(Uri.parse(apiUrl + '/posts'),
        headers: {
          'Authorization': 'BEARER $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'title': postContent.title,
          'body': postContent.body,
          'price': double.parse(postContent.price),
          'hasEmail': postContent.hasEmail,
          'hasPhone': postContent.hasPhone,
          'subject': postContent.subject,
          'region': postContent.region,
          'tags': postContent.tags
        }));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Future.value(data['message']);
    } else {
      return Future.value(data['message']);
    }
  }
}
