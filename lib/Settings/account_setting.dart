import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/app_bar_widget.dart';
import 'package:final_t_and_t/Widgets/custom_dialog.dart';
import 'package:final_t_and_t/Widgets/edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountSetting extends StatefulWidget {
  static const String id = 'AccountSetting';
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController phone = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController headline = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mainUser = Provider.of<MainUser>(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBox) {
          return [
            AppBarWidget(
              title: 'Account Settings',
              expand: 180.0,
            )
          ];
        },
        body: ListView(
          children: [
            SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: mainUser.profileImage == null
                          ? appBarBackground
                          : mainUser.profileImage.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  mainUser.fName + ' ' + mainUser.lName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Signika Negative',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: width - 30.0,
                  margin: EdgeInsets.only(right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      EditWidget(
                        label: 'First Name',
                        info: mainUser.fName,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  keyValue: 'firstName',
                                  controller: fname,
                                  hint: 'Enter a name',
                                  msg: 'Change your first name',
                                );
                              });
                        },
                        controller: fname,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                      EditWidget(
                        label: 'Last Name',
                        info: mainUser.lName,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  keyValue: 'lastName',
                                  controller: lname,
                                  hint: 'Enter a name',
                                  msg: 'Change your last name',
                                );
                              });
                        },
                        controller: lname,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                      EditWidget(
                        label: 'Headline',
                        info: mainUser.headline,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  keyValue: 'headline',
                                  controller: headline,
                                  hint: 'Enter a headline',
                                  msg: 'Change your headline',
                                );
                              });
                        },
                        controller: headline,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                      EditWidget(
                        label: 'twitter',
                        info: mainUser.twitter,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  keyValue: 'twitter',
                                  controller: twitter,
                                  hint: 'Enter a twitter account',
                                  msg: 'Change your twitter account',
                                );
                              });
                        },
                        controller: twitter,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                      EditWidget(
                        label: 'ُEmail',
                        info: mainUser.email,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  isEmail: true,
                                  keyValue: 'email',
                                  controller: email,
                                  hint: 'Enter an email',
                                  msg: 'Change your email',
                                );
                              });
                        },
                        controller: email,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                      EditWidget(
                        label: 'Phone',
                        info: mainUser.phone,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  keyValue: 'phoneNumber',
                                  controller: phone,
                                  hint: 'Enter a phone number',
                                  msg: 'Change your phone number',
                                );
                              });
                        },
                        controller: email,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                      EditWidget(
                        label: 'Paassword',
                        info: '**********',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  keyValue: 'password',
                                  controller: password,
                                  isPassword: true,
                                );
                              });
                        },
                        controller: password,
                      ),
                      Divider(),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //logoutDialogue();
                  },
                  child: Container(
                    width: width - 40.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 15.0,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
