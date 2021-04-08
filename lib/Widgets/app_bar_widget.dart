import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final double expand;
  AppBarWidget({this.expand = 180.0, this.title});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expand,
      pinned: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: appBarBackground,
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
