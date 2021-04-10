import 'dart:convert';

import 'package:final_t_and_t/Providers/post.dart';
import 'package:final_t_and_t/Providers/user.dart';
import 'package:final_t_and_t/Providers/users.dart';
import 'package:final_t_and_t/constatns.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Posts with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts {
    return [..._posts];
  }

  List<Post> searchForPosts(String title) {
    title = title.toLowerCase().trim();
    List<Post> posts = [];
    _posts.forEach((element) {
      if (element.title.toLowerCase().contains(title)) {
        posts.add(element);
      }
    });
    return posts;
  }

  Future<int> fetchMiniPosts([String subject = 'all', User mainUser]) async {
    Response response;
    List<Post> posts = [];
    var data;
    if (subject == 'all') {
      response = await get(Uri.parse(apiUrl + '/posts/all'));
      data = jsonDecode(response.body);
    } else {
      response = await get(Uri.parse(apiUrl + '/posts/all?subject=$subject'));
      data = jsonDecode(response.body);
    }

    if (data['posts'].length == 0) {
      return Future.value(0);
    }

    for (var post in data['posts']) {
      User user = await Users.getUserById(post['userId'].toString());
      posts.add(Post(
        title: post['title'].toString(),
        price: post['price'].toString(),
        region: post['region'].toString(),
        creator: user,
        imageUrl: user.avatar,
        body: post['body'],
        subject: post['subject'],
      ));
    }
    _posts = posts;
    notifyListeners();
    return Future.value(1);
  }
}
