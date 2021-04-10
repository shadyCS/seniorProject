import 'dart:convert';

import 'package:final_t_and_t/Providers/user.dart';
import 'package:final_t_and_t/constatns.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'main_user.dart';

bool isMe = false;

class Users with ChangeNotifier {
  List<User> _users = [];
  List<User> _topUsers = [];

  Future<void> fetchTopRated() async {
    var response = await get(Uri.parse(apiUrl + '/users/featured'));
    var data = jsonDecode(response.body);
    List<User> topLoaded = [];
    for (var user in data['user']) {
      topLoaded.add(User(
          id: user['id'].toString(),
          name: user['firstName'] + ' ' + user['lastName'],
          price: user['price'],
          avatar: Image.memory(base64Decode(user['avatar'])),
          headLine: user['headline'].toString(),
          rating: double.parse(user['rating']).toStringAsFixed(1)));
    }
    _topUsers = topLoaded;
    notifyListeners();
  }

  List<User> get users {
    return [..._users];
  }

  List<User> get topUsers {
    return [..._topUsers];
  }

  Future<User> getUserDetailes(MainUser mainUser, String userID) async {
    bool isRated;
    var response = await get(Uri.parse(apiUrl + '/users/$userID/rating'),
        headers: {'Authorization': 'BEARER ${mainUser.token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      isRated = data['isRated'];
    }
    User user;
    response = await get(Uri.parse(apiUrl + '/users/$userID'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      user = User(
        id: data['user']['id'].toString(),
        email: data['user']['email'].toString(),
        name: data['user']['firstName'].toString() +
            ' ' +
            data['user']['lastName'].toString(),
        phoneNumber: data['user']['phoneNumber'].toString(),
        headLine: data['user']['headline'].toString(),
        twitter: data['user']['twitter'].toString(),
        avatar: Image.memory(base64Decode(data['user']['avatar'])),
        price: data['user']['price'].toString(),
        rating: data['user']['rating'].toStringAsFixed(1),
        joinedDate: data['user']['joinDate'].toString().split('T')[0],
        isRated: isRated,
      );
    }
    return Future.value(user);
  }

  static Future<User> getUserById(String userId) async {
    User user;
    var response = await get(Uri.parse(apiUrl + '/users/$userId'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      user = User(
        id: data['user']['id'].toString(),
        email: data['user']['email'].toString(),
        name: data['user']['firstName'].toString() +
            ' ' +
            data['user']['lastName'].toString(),
        phoneNumber: data['user']['phoneNumber'].toString(),
        headLine: data['user']['headline'].toString(),
        twitter: data['user']['twitter'].toString(),
        avatar: Image.memory(base64Decode(data['user']['avatar'])),
        price: data['user']['price'].toString(),
        rating: data['user']['rating'].toStringAsFixed(1),
        joinedDate: data['user']['joinDate'].toString().split('T')[0],
      );
      return Future.value(user);
    }
  }
}
