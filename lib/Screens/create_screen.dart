import 'package:final_t_and_t/Screens/new_post_screen.dart';
import 'package:final_t_and_t/Screens/new_textbook.dart';
import 'package:final_t_and_t/Widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxScrolled) {
        return [
          AppBarWidget(
            expand: 180,
            title: 'Add Post Or Textbook',
          )
        ];
      },
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, NewTextbookScreen.id);
            },
            child: Container(
              height: 250,
              width: width,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/Textbook.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'List Textbook',
                    style: TextStyle(
                      backgroundColor: Colors.black54,
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, NewPostScreen.id);
            },
            child: Container(
              height: 250,
              width: width,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/posts.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Add New Post',
                    style: TextStyle(
                      backgroundColor: Colors.black54,
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
