import 'package:covid_reviews/services/auth.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:flutter/material.dart';

class CreateReview extends StatelessWidget {
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (val) =>
                  val.length < 6 ? 'Enter a password 6+ chars long' : null,
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _authService
                      .signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'invalid credntials';
                      loading = false;
                    });
                  }
                }
              },
            ),
            SizedBox(height: 12.0),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
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
      ),
    );
  }
}
