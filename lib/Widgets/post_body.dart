import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class PostBody extends StatelessWidget {
  PostBody({this.postBody});
  final String postBody;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextStyle(
              style: TextStyle(
                decoration: TextDecoration.none,
              ),
              child: Html(
                data: postBody,
                style: {
                  'p': Style(fontSize: FontSize(18), wordSpacing: 1.0),
                  'li': Style(fontSize: FontSize(18))
                },
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
