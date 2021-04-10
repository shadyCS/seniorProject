import 'package:final_t_and_t/Providers/posts.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  static const String id = 'PostsScreen';
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

bool _isInit = true;
bool _isLoading = false;
bool _noPosts = false;

class _PostsScreenState extends State<PostsScreen> {
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final String subject =
          ModalRoute.of(context).settings.arguments as String;
      Provider.of<Posts>(context, listen: false)
          .fetchMiniPosts(subject ?? 'all')
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        if (value == 0) {
          _noPosts = true;
        } else {
          _noPosts = false;
        }
      });
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _isInit = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context).posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? Center(
              child: SpinKitChasingDots(
                color: kPrimaryColor,
              ),
            )
          : _noPosts
              ? Center(
                  child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'Assets/Images/no_result.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                      )),
                )
              : ListView.builder(
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
