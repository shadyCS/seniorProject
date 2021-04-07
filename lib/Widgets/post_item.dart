import 'package:final_t_and_t/Providers/post.dart';
import 'package:final_t_and_t/Screens/post_screen.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final int index;
  final Post item;
  PostItem({this.index, this.item});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PostScreen.id, arguments: item);
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 15.0,
          left: 15.0,
          top: (index == 0) ? 15.0 : 0.0,
          bottom: 15.0,
        ),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 1.5,
              spreadRadius: 1.5,
              color: Colors.grey[200],
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Container(
              width: width - 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 4.0, right: 8.0, left: 8.0),
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    child: Text(
                      '${item.price} SAR',
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.6,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.region,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Signika Negative',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.7,
                            color: headingColor,
                          ),
                        ),
                        SizedBox(width: 3.0),
                        Icon(Icons.location_city, size: 14.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
