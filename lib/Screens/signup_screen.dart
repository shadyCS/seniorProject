import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Data/validators.dart';
import 'package:final_t_and_t/Screens/home.dart';
import 'package:final_t_and_t/Screens/login_screen.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/button_widget.dart';
import 'package:final_t_and_t/constatns.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

String firstPassword;

class _SignUpScreenState extends State<SignUpScreen> {
  ProgressDialog loading;
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  // Toggles the password show status
  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Toggles the confirm password show status
  void _viewConfirmPassword() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
                    'Sign up',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
            )
          ];
        },
        body: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: nameValidation,
                      inputFormatters: [denyInput()],
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: nameValidation,
                      inputFormatters: [denyInput()],
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: emailController,
                      validator: emailValidation,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: passwordValidation,
                      onChanged: (value) {
                        setState(() {
                          firstPassword = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
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
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: confirmPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: confirmPasswordValidation,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: _viewConfirmPassword,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                      obscureText: _obscureConfirmText,
                    ),
                    SizedBox(height: 40.0),
                    ButtonWidget(
                      text: 'Sign up',
                      onTap: () async {
                        if (formKey.currentState.validate()) {
                          loading = ProgressDialog(context,
                              type: ProgressDialogType.Normal);
                          loading.show();
                          await post(Uri.parse(apiUrl + '/users'), body: {
                            'firstName': firstNameController.text.trim(),
                            'lastName': lastNameController.text.trim(),
                            'email': emailController.text.trim(),
                            'password': passwordController.text
                          }).then((resp) async {
                            if (resp.statusCode == 200) {
                              Provider.of<MainUser>(context, listen: false)
                                  .loginUser(emailController.text.trim(),
                                      passwordController.text)
                                  .then((value) {
                                if (value == 'Success') {
                                  loading.hide();
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.id);
                                }
                              });
                            } else {}
                          });
                        } else {}
                      },
                    ),
                    SizedBox(height: 20.0),
                    SecondryButton(
                      text: 'Or Sign in',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
