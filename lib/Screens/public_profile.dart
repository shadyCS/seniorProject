import 'package:final_t_and_t/Providers/main_user.dart';
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
    double width = MediaQuery.of(context).size.width;
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
                InfoText(label: 'Joined at', info: 'Not Yet' //user.joinedDate,
                    ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Headline',
                  info: user.headline ?? 'Not added yet',
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(label: 'Price', info: 'Not yet' //user.price,
                    ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Rating',
                  info: 'Not Yet', //user.rating,
                  triling: Icon(Icons.star, size: 18.0),
                ),
                Divider(),
                SizedBox(height: 15.0),
                InfoText(
                  label: 'Phone',
                  info: user.phone,
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
        Flexible(
          child: Container(
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
