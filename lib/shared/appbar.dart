import 'package:covid_reviews/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_reviews/shared/constants.dart';

final AuthService _authService = AuthService();

Widget customAppBar(String text, IconButton iconButton, List<Widget> actions) {
  Widget iconWidget;
  if (iconButton == null) {
    iconWidget = null;
  } else {
    iconWidget = IconButton(icon: iconButton, onPressed: () {});
  }
  return AppBar(
    title: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: true,
    leading: iconWidget,
    backgroundColor: appBarColor,
    brightness: Brightness.dark,
    elevation: 0.0,
    actions: actions,
  );
}
