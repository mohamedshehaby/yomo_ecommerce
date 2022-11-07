import 'package:flutter/material.dart';

import '../presentation/resources/color_manager.dart';

/// [validateEmail] based on [emailRegex]
String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

bool validateEmail(String email, String regex) => RegExp(regex).hasMatch(email);

/// [validatePassword] based on [passwordRegex]
String passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

bool validatePassword(String password, String regex) => RegExp(regex).hasMatch(password);

Color mapStatusToColor(String status) {
  if (status == 'pending') {
    return ColorManager.primary;
  } else if (status == 'confirmed') {
    return Colors.teal;
  } else if (status == 'delivered') {
    return Colors.green;
  } else if (status == 'cancelled') {
    return Colors.red;
  }
  return Colors.grey;
}
