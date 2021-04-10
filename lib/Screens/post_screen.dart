import 'package:final_t_and_t/Providers/post.dart';
import 'package:final_t_and_t/Widgets/post_body.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  static const String id = 'PostScreen';
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final postInfo = ModalRoute.of(context).settings.arguments as Post;
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              forceElevated: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        width: width,
                        height: 300,
                        padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: postInfo.imageUrl.image,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        width: width,
                        height: 440.0,
                        padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      top: 100,
                      child: Container(
                        height: 375.0,
                        width: width,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              postInfo.subject,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              postInfo.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          postInfo.region,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontFamily: 'Signika Negative',
                                          ),
                                        ),
                                        SizedBox(width: 2.0),
                                        Icon(
                                          Icons.location_city,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                        SizedBox(width: 5.0),
                                        // Text(
                                        //   '(${courseData.courseNumberOfRating} Reviews)',
                                        //   style: TextStyle(
                                        //     color: textColor,
                                        //     fontSize: 14.0,
                                        //     fontFamily: 'Signika Negative',
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '${postInfo.price} SAR',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.0,
                                        fontFamily: 'Signika Negative',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          child: PostBody(
            postBody: postInfo.body,
          ),
        ));
  }
}
