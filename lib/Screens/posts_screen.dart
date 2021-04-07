import 'package:final_t_and_t/Providers/posts.dart';
import 'package:final_t_and_t/Widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  static const String id = 'PostsScreen';
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context).posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostItem(
            index: index,
            item: posts[index],
          );
        },
      ),
    );
  }
}
