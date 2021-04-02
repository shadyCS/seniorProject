import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/category_slider.dart';
import 'package:final_t_and_t/Widgets/main_slider.dart';
import 'package:final_t_and_t/Widgets/user_slider.dart';
import 'package:flutter/material.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    constractPage() {
      return NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
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
                            fontFamily: 'Signika Negative',
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
                                image: NetworkImage(
                                    'https://i.pinimg.com/564x/8d/37/2c/8d372c1f9427feac8b5909e660a63bf6.jpg'),
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
