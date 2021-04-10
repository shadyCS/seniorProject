import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Widgets/info_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicProfileScreen extends StatefulWidget {
  static const String id = 'PublicProfile';
  @override
  _PublicProfileScreenState createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MainUser>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '${user.fName + ' ' + user.lName}\'s Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.canPop(context);
            }
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
                        image: user.profileImage.image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  user.fName + ' ' + user.lName,
                  style: TextStyle(
                    fontFamily: 'Signika Negative',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15.0),
                InfoText(
                    label: 'Joined at', info: user.joinDate //user.joinedDate,
                    ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Headline',
                  info:
                      user.headline == 'null' ? 'Connect user' : user.headline,
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                    label: 'Price',
                    info: user.price == 'null'
                        ? 'No price yet'
                        : user.price //user.price,
                    ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Rating',
                  info: user.rating == 'null'
                      ? 'Not rated yet'
                      : user.rating, //user.rating,
                  triling: Icon(Icons.star, size: 18.0),
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Phone',
                  info: user.phone == 'null' ? 'N/A' : user.phone,
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Email',
                  info: user.email,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
