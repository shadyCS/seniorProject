import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(bottom: 0.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: (height / 4.2),
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
                },
                child: Container(
                  width: width,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://optinmonster.com/wp-content/uploads/2015/04/typesofblogposts.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Browse Posts',
                        style: TextStyle(
                          backgroundColor: Colors.black54,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'Signika Negative',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Be updated by browsing the newest posts',
                        style: TextStyle(
                          backgroundColor: Colors.black54,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
                },
                child: Container(
                  width: width,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://www.bu.edu/files/2017/09/resize-18-1651-TEXTBOOK-037.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Browse Textbooks',
                        style: TextStyle(
                          backgroundColor: Colors.black54,
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'Signika Negative',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Dont let your poor stops you from learning',
                        style: TextStyle(
                          backgroundColor: Colors.black54,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
