import 'package:covid_reviews/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_reviews/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0.0,
            title: Text('Sign in to Covid Reviews'),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Register'))
            ]),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
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
                color: Colors.pink,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _authService
                        .signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'invalid credntials');
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
        ));
  }
}
