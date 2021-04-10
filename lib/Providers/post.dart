import 'package:final_t_and_t/Providers/user.dart';
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
  bool hasEmail;
  bool hasPhone;
  String email;
  String phone;
  String user;
  Image imageUrl;
  User creator;

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
      this.imageUrl,
      this.creator,
      this.hasEmail = false,
      this.hasPhone = false});
}
