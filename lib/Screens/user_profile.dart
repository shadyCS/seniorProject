import 'package:final_t_and_t/Providers/user.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class UserProfile extends StatefulWidget {
  static const String id = 'UserProfoile';
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final user = ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '${user.name}\'s Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.only(right: 20.0, left: 20.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: NetworkImage(user.imageCode), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  user.name,
                  style: TextStyle(
                    fontFamily: 'Signika Negative',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Joined at',
                  info: user.joinedDate,
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Headline',
                  info: user.headLine,
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Price',
                  info: user.price,
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Rating',
                  info: user.rating,
                  triling: Icon(Icons.star, size: 18.0),
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Phone',
                  info: user.phoneNumber,
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Email',
                  info: user.email,
                ),
                Divider(),
                SizedBox(height: 15.0),
                user.isRated
                    ? Text(
                        'Thank you for rating me',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Signika Negative',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : SmoothStarRating(
                        onRated: (value) {},
                        size: 50,
                        allowHalfRating: false,
                        starCount: 5,
                        color: Colors.black,
                        borderColor: Colors.black87,
                        spacing: 1.0,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({
    this.info,
    this.label,
    @optionalTypeArgs this.triling,
  });
  final String label;
  final String info;
  final Icon triling;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 120.0,
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(
            info,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Signika Negative',
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: 3.0,
        ),
        triling ?? Container()
      ],
    );
  }
}
