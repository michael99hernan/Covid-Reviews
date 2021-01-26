//This is where you will build a list of reviews
import 'package:covid_reviews/models/review.dart';
import 'package:covid_reviews/services/review_services.dart';
import 'package:covid_reviews/shared/appbar.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:flutter/material.dart';

class StoreReviews extends StatefulWidget {
  @override
  _StoreReviewsState createState() => _StoreReviewsState();
}

class _StoreReviewsState extends State<StoreReviews> {
  ReviewService _reviewService =
      new ReviewService(); //This allows us to get the list of the reviews from database
  List<Review> reviewList =
      new List<Review>(); //This will have the list of reviews
  // TODO: This is hard coded value for a storeId for testing. We will change this next sprint.
  String storeId = 'kK0yUEMx9hTLZa9xeSFQ';

  // This function is called when the page is loaded
  @override
  void initState() async {
    super
        .initState(); // This calls the original init state (no need to worry about this)
    reviewList = await _reviewService
        .listReviewsByStore(storeId); //This gets reviews from database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(
        'Reviews',
        null,
        null,
      ),
      body: ListView.builder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {},
      ),
    );
  }
}
