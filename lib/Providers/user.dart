import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String id;
  Image avatar;
  String name;
  String headLine;
  String rating;
  String numberOfRating;
  String price;
  String email;
  String phoneNumber;
  String joinedDate;
  bool isRated;
  String twitter;

  User(
      {this.id,
      this.headLine,
      this.avatar,
      this.name,
      this.numberOfRating,
      this.rating,
      this.price,
      this.email,
      this.joinedDate,
      this.phoneNumber,
      this.isRated,
      this.twitter});
}
