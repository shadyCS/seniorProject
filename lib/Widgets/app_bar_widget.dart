import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Screens/public_profile.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final double expand;
  AppBarWidget({this.expand = 180.0, this.title});
  @override
  Widget build(BuildContext context) {
    final _me = Provider.of<MainUser>(context);
    return SliverAppBar(
        expandedHeight: 200,
        pinned: true,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PublicProfileScreen.id);
                  },
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      image: DecorationImage(
                        image: _me.profileImage.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false);
  }
}
