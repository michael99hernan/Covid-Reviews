import 'package:flutter/material.dart';
import 'package:covid_reviews/models/store.dart';
import 'package:covid_reviews/models/review.dart';

class ReviewsPage extends StatelessWidget {
  final Store store;
  final Review reviewer;

  ReviewsPage({this.store, this.reviewer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${store.name}'),
        elevation: 0.0,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateReview(),
            ),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return List<Review>(
      
      
      },
    );
  }

  Widget _buildReviewsList(
      BuildContext context ) {
    return List<Review>(
      
    );
  }

  Widget _buildReview(BuildContext context) {
    Review review;
    return ListTile(
      leading: CircleAvatar(
        child: Text(review.authorName.substring(0, 1).toUpperCase()),
      ),
      title: Text(review.authorName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _reviewsStarWidget(review.rating),
          Text(review.text),
        ],
      ),
    );
  }

  Widget _reviewsStarWidget(int rating) {
    var stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      Icon star = i < rating
          ? Icon(Icons.star, color: Colors.orangeAccent, size: 12)
          : Icon(Icons.star_border, color: Colors.orangeAccent, size: 12);
      stars.add(star);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
