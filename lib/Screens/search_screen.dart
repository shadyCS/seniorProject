import 'package:final_t_and_t/Providers/post.dart';
import 'package:final_t_and_t/Providers/posts.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'SearchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showBackground = true;
  bool showIndicator = true;
  List<Post> matchedPosts = [];
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context);
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              titleSpacing: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: appBarBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    // width: width - 20.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          if (value.isEmpty) {
                            showBackground = true;
                          } else {
                            showBackground = false;
                            matchedPosts = posts.searchForPosts(value);
                            if (matchedPosts.length != 0) {
                              showIndicator = false;
                            } else {
                              showIndicator = true;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: showBackground
            ? Particles(50, kPrimaryColor.withOpacity(0.2))
            : showIndicator
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : matchedPosts.length != 0
                    ? ListView.builder(
                        itemCount: matchedPosts.length,
                        itemBuilder: (context, index) {
                          return PostItem(
                            index: index,
                            item: matchedPosts[index],
                          );
                        },
                      )
                    : Container());
  }
}
