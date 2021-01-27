//This is where you will build a list of reviews
import 'package:covid_reviews/models/review.dart';
import 'package:covid_reviews/services/review_services.dart';
import 'package:covid_reviews/shared/appbar.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:covid_reviews/shared/loading.dart';
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

  /// Calls the review service and assigns it to reviewList
  Future getReviews() async {
    reviewList = await _reviewService.listReviewsByStore(storeId);
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
      body: Container(
        child: FutureBuilder(
          //The future builder allows us to call the get reviews function
          future: getReviews(), // Calls the function to get the list of reviews
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //While loading the reviews...
              return Loading(); // display the loading symbol
            } else {
              //Once done loading display the list of reviews
              //THIS IS WHERE MOST OF THE CODE GOES
              return ListView.builder(
                itemCount: reviewList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      // TODO: Once noel is done with code call his page when clicked.
                      // TODO: Add the date
                      // TODO: Add the ratings
                      onTap: () {},
                      title: Text(reviewList[index].authorName),
                      subtitle: Text(reviewList[index].text),
                    ),
                  );
                },
              );
              //MOST OF THE CODE WILL BE ABOVE HERE
            }
          },
        ),
      ),
    );
  }
}
