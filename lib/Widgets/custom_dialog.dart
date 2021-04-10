import 'package:final_t_and_t/Data/validators.dart';
import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Screens/signup_screen.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  CustomDialog(
      {this.controller,
      this.msg,
      this.hint,
      this.onTap,
      this.keyValue,
      this.isPassword = false,
      this.isEmail = false});
  TextEditingController controller;
  TextEditingController classController;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final String msg;
  final String hint;
  final onTap;
  String value;
  final String keyValue;
  final bool isPassword;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    final mainUser = Provider.of<MainUser>(context);
    double width = MediaQuery.of(context).size.width;
    return isPassword
        ? Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 295.0,
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Change Your Password",
                      style: TextStyle(
                        fontFamily: 'Signika Negative',
                        fontSize: 21.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: passwordValidation,
                      onChanged: (value) {
                        firstPassword = value;
                      },
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: confirmPasswordController,
                      validator: confirmPasswordValidation,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Confirm New Password',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            mainUser.changeEmailOrPassword(
                                'password', passwordController.text);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Okay',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    msg,
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: classController,
                    onChanged: (value) {
                      this.value = value;
                    },
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.text = this.value;
                          if (isEmail) {
                            mainUser.changeEmailOrPassword(
                                'email', controller.text.trim());
                          } else {
                            mainUser.changeInfo(
                                keyValue, controller.text.trim());
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
