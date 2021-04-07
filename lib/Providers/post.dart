import 'package:flutter/cupertino.dart';

class Post with ChangeNotifier {
  String postID;
  String userID;
  String region;
  String title;
  String body;
  String subject;
  String price;
  String createdAt;
  String updatedAt;
  List<String> tags = [];
  String email;
  String phone;
  String user;
  String imageUrl;

  Post(
      {this.postID,
      this.userID,
      this.region,
      this.title,
      this.body,
      this.subject,
      this.price,
      this.createdAt,
      this.email,
      this.phone,
      this.tags,
      this.updatedAt,
      this.user,
      this.imageUrl});
}
