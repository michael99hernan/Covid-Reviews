import 'package:covid_reviews/screens/review/create_review.dart';
import 'package:covid_reviews/screens/review/list_store_reviews.dart';
import 'package:covid_reviews/services/auth.dart';
import 'package:covid_reviews/shared/appbar.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:covid_reviews/services/review_services.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  final ReviewService reviewService = new ReviewService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(
        "Hello",
        null,
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
              onPressed: () {
                print('Create review pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateReview()),
                );
              },
              child: Text('REPLACE WITH View Review'),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                print('View a single review');
                Navigator.push(
                  context,
                  // TODO: Replace with view a review page
                  MaterialPageRoute(builder: (context) => CreateReview()),
                );
              },
              child: Text('REPLACE WITH List reviews'),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                print('View a list of reviews');
                Navigator.push(
                  context,
                  // TODO: Replace with a list of reviews page
                  MaterialPageRoute(builder: (context) => StoreReviews()),
                );
              },
              child: Text('List Reviews'),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                //test buttons here
                print('Test button pressed');
                Navigator.push(
                  context,
                  // TODO: Replace with a page you are testing
                  MaterialPageRoute(builder: (context) => CreateReview()),
                );
              },
              child: Text('Button for test'),
            ),
          ],
        ),
      ),
    );
  }
}
