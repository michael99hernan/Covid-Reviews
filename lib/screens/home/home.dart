import 'package:covid_reviews/services/auth.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Covid Reviews'),
        backgroundColor: appBarColor,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text(
                'sign out',
              ))
        ],
      ),
    );
  }
}
