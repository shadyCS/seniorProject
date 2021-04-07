import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Providers/posts.dart';
import 'package:final_t_and_t/Providers/screen_changer.dart';
import 'package:final_t_and_t/Providers/users.dart';
import 'package:final_t_and_t/Screens/forgot_password.dart';
import 'package:final_t_and_t/Screens/home.dart';
import 'package:final_t_and_t/Screens/login_screen.dart';
import 'package:final_t_and_t/Screens/post_screen.dart';
import 'package:final_t_and_t/Screens/posts_screen.dart';
import 'package:final_t_and_t/Screens/signup_screen.dart';
import 'package:final_t_and_t/Screens/user_profile.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ScreenChanger()),
        ChangeNotifierProvider.value(value: Users()),
        ChangeNotifierProvider.value(value: Posts()),
        ChangeNotifierProvider.value(value: MainUser())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(primaryColor: kPrimaryColor, accentColor: kPrimaryColor),
        initialRoute: LoginScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          UserProfile.id: (context) => UserProfile(),
          PostsScreen.id: (context) => PostsScreen(),
          PostScreen.id: (context) => PostScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ForgotPassword.id: (context) => ForgotPassword()
        },
      ),
    );
  }
}
