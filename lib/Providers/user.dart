import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  int id;
  String imageCode;
  String name;
  String headLine;
  String rating;
  String numberOfRating;
  String price;
  String email;
  String phoneNumber;
  String joinedDate;
  bool isRated;

  User(
      {this.id,
      this.headLine,
      this.imageCode,
      this.name,
      this.numberOfRating,
      this.rating,
      this.price,
      this.email,
      this.joinedDate,
      this.phoneNumber,
      this.isRated});
}
