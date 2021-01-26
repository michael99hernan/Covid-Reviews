import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_reviews/models/review.dart';

class ReviewService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  /// adds a review and returns the review added
  Future<void> addReview(Review review) async {
    try {
      db.collection('stores').doc(review.storeId).collection('reviews').add(({
            'authorName': review.authorName,
            'authorId': review.authorId,
            'rating': review.rating,
            'text': review.text,
            'datePublished': review.time,
            'wearMask': review.wearMask,
            'sixFeet': review.sixFeet,
            'handSani': review.handSani,
            'storeName': review.storeName,
            'storeId': review.storeId,
          }));
    } catch (exception) {
      print(exception.toString());
      print("Error occurred while adding review");
    }
    return db;
  }

  /// deletes a review and returns nothing
  void deleteReview() {
    try {
      db
          .collection("stores")
          .doc("review")
          .delete()
          .then((value) => print("deleted"));
    } catch (exception) {
      print(exception.toString());
      print('Error deleting review');
    }
  }

  /// lists all reviews by store which returns a list of reviews
  Future<void> listReviewsByStore(String storeId) async {
    try {
      List<Review> reviewList = new List<Review>();
      var list = await db
          .collection("stores")
          .doc(storeId)
          .collection("reviews")
          .get();
      for (var item in list.docs) {
        var data = item.data();
        Review review = new Review(
          authorName: data["authorName"],
          authorId: data["authorId"],
          rating: data["rating"],
          text: data["text"],
          time: data["datePublished"].toDate(),
          wearMask: data["wearMask"],
          sixFeet: data["sixFeet"],
          handSani: data["handSani"],
          storeName: data["storeName"],
          storeId: data["storeId"],
        );

        reviewList.add(review);
      }

      return reviewList;
    } catch (exception) {
      print(exception.toString());
      print("Error occurred while listing all reviews by one store");
    }
  }

  /// displays one review and returns the review
  Future<void> readOneReview(String reviewId, String storeId) async {
    try {
      var data = await db
          .collection("stores")
          .doc(storeId)
          .collection("reviews")
          .doc(reviewId)
          .get();

      Review review = new Review(
        authorName: data["authorName"],
        authorId: data["authorId"],
        rating: data["rating"],
        text: data["text"],
        time: data["datePublished"].toDate(),
        wearMask: data["wearMask"],
        sixFeet: data["sixFeet"],
        handSani: data["handSani"],
        storeName: data["storeName"],
        storeId: data["storeId"],
      );
      return review;
    } catch (exception) {
      print(exception.toString());
      print("Error occurred while listing one review");
    }
  }

  /// updates a review then returns the updating review
  Future<void> updateReview(
      String reviewId, String storeId, Review review) async {
    try {
       db
          .collection("stores")
          .doc(storeId)
          .collection("reviews")
          .doc(reviewId)
          .update({
        'authorName': review.authorName,
        'authorId': review.authorId,
        'rating': review.rating,
        'text': review.text,
        'datePublished': review.time,
        'wearMask': review.wearMask,
        'sixFeet': review.sixFeet,
        'handSani': review.handSani,
        'storeName': review.storeName,
        'storeId': review.storeId,
      });
      return review;
    } catch (exception) {
      print(exception.toString());
      print("error occurred while updating review");
    }
  }
}
