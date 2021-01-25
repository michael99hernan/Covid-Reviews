import 'package:covid_reviews/services/auth.dart';
import 'package:covid_reviews/shared/appbar.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:covid_reviews/screens/review/reviews.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(
        "Hello",
        IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
        <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text(
                'sign out',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              onPressed: null,
              child: Text('Create review'),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) =>
                    Review()),
                    );
              },
              child: Text('View review'),
            ),
          ],
        ),
      ),
    );
  }
}
