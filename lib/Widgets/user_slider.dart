import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Providers/users.dart';
import 'package:final_t_and_t/Screens/public_profile.dart';
import 'package:final_t_and_t/Screens/user_profile.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class UserSlider extends StatefulWidget {
  @override
  _UserSliderState createState() => _UserSliderState();
}

bool _isInit = true;
bool _isLoading = false;

class _UserSliderState extends State<UserSlider> {
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Users>(context).fetchTopRated().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final users = Provider.of<Users>(context).topUsers;
    final mainUser = Provider.of<MainUser>(context);

    return Container(
      width: width,
      height: 340.0,
      color: Theme.of(context).appBarTheme.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Top Rated Users',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Signika Negative',
                letterSpacing: 0.7,
              ),
            ),
          ),
          Container(
            height: 280.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return _isLoading
                    ? Center(
                        child: SpinKitRipple(color: kPrimaryColor),
                      )
                    : InkWell(
                        onTap: () async {
                          ProgressDialog loading = ProgressDialog(context,
                              type: ProgressDialogType.Normal);
                          if (users[index].id.toString() != mainUser.id) {
                            loading.show();
                            var user =
                                await Provider.of<Users>(context, listen: false)
                                    .getUserDetailes(
                                        mainUser, users[index].id.toString());
                            loading.hide();
                            Navigator.pushNamed(context, UserProfile.id,
                                arguments: user);
                          } else {
                            isMe = true;
                            Navigator.pushNamed(
                                context, PublicProfileScreen.id);
                          }
                        },
                        child: Container(
                          width: 180.0,
                          height: 200.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.5,
                                spreadRadius: 1.5,
                                color: Colors.grey[300],
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 150.0,
                                width: 200.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Container(
                                  height: 130.0,
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(65.0),
                                    image: DecorationImage(
                                      image: users[index].avatar.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      users[index].name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      users[index].headLine == 'null'
                                          ? 'Connect user'
                                          : users[index].headLine,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          users[index].rating,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 17.0,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
