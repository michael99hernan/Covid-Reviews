import 'package:covid_reviews/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(232, 232, 232, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(213, 216, 219, 1),
          elevation: 0.0,
          title: Text('Sign in to Covid Reviews'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text('Sign in anon'),
            onPressed: () async {
              dynamic result = await _authService.signInAnon();
              if (result == null) {
                print('Error signing in anon user');
              } else {
                print('Anon user signed in');
                print(result);
              }
            },
          ),
        ));
  }
}
