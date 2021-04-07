import 'package:final_t_and_t/Screens/signup_screen.dart';
import 'package:flutter/services.dart';

final Function denyInput =
    () => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));

final Function nameValidation = (value) {
  RegExp nameExp = RegExp(r'^[a-zA-Z]{2,}$');
  value = value.trim();
  if (nameExp.hasMatch(value)) {
    return null;
  } else if (value.isEmpty) {
    return 'Filed can\'t be empty';
  } else if (value.length < 2) {
    return 'Name must be at least 2 letters';
  }
};

final Function emailValidation = (value) {
  value = value.trim();
  RegExp emailExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$');
  if (emailExp.hasMatch(value)) {
    return null;
  } else if (value.isEmpty) {
    return 'Filed can\'t be empty';
  } else {
    return 'Email format is incorrect';
  }
};

// final Function passwordValidation = (value) {
//   value = value.trim();
//   if (value.length < 8) {
//     return 'Password must be at least 8 characters';
//   }
// };
final Function confirmPasswordValidation = (value) {
  value = value.trim();
  if (value != firstPassword) {
    return 'Passwords are not matched';
  }
};

Function passwordValidation = (String obj) {
  final regex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*[@$!%*#?&])[A-Za-z@$!%*#?&]{10,}$/');
  if (regex.hasMatch(obj)) {
    return null;
  } else if (obj.length < 10) {
    return 'Password must contain at least 10 characters';
  } else if (!obj.contains(RegExp(r'[@$!%*#?&]+'))) {
    return 'Password must contain at least one special character';
  }
};
