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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text('Sign in to Covid Reviews'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {},
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {},
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {},
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Guest',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  dynamic result = await _authService.signInAnon();
                  if (result == null) {
                    print('Error signing in anon user!');
                  } else {
                    print('Anon user signed in');
                    print(result);
                  }
                },
              )
            ]),
          ),
        ));
  }
}
