import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Data/validators.dart';
import 'package:final_t_and_t/Screens/forgot_password.dart';
import 'package:final_t_and_t/Screens/home.dart';
import 'package:final_t_and_t/Screens/signup_screen.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Initially password is obscure
  bool _obscureText = true;
  DateTime currentBackPressTime;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ProgressDialog loading;

  // Toggles the password show status
  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: appBarBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Column(
                children: <Widget>[
                  Image.asset('Assets/Images/login.png'),
                  TextFormField(
                    controller: email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: emailValidation,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                      contentPadding:
                          const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: 'Signika Negative',
                        color: Colors.grey[500],
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: _viewPassword,
                      ),
                      contentPadding:
                          const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    ),
                    obscureText: _obscureText,
                  ),
                  SizedBox(height: 40.0),
                  ButtonWidget(
                    text: 'Sign in',
                    onTap: () async {
                      loading = ProgressDialog(context,
                          type: ProgressDialogType.Normal);
                      loading.show();
                      Provider.of<MainUser>(context, listen: false)
                          .loginUser('dj.shadow2017@outlook.com', 'Sh1651632')
                          .then((value) {
                        if (value == 'Success') {
                          loading.hide();
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.id);
                        } else {
                          loading.hide();
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Error',
                            desc: value,
                            btnOkColor: Colors.red,
                            btnOkOnPress: () {},
                          )..show();
                        }
                      });
                    },
                  ),
                  SizedBox(height: 15.0),
                  SecondryButton(
                    text: 'Or Sign up',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUpScreen.id);
                    },
                  ),
                  SecondryButton(
                    text: 'Forgot your password?',
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPassword.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
