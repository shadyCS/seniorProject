import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/category_slider.dart';
import 'package:final_t_and_t/Widgets/main_slider.dart';
import 'package:final_t_and_t/Widgets/user_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _me = Provider.of<MainUser>(context);
    constractPage() {
      return NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(
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
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
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
                automaticallyImplyLeading: false),
          ];
        },
        body: ListView(
          children: [
            MainSlider(),
            SizedBox(height: 10),
            CategorySlider(),
            SizedBox(height: 10),
            UserSlider(),
          ],
        ),
      );
    }

    return Scaffold(
      body: constractPage(),
    );
  }
}
