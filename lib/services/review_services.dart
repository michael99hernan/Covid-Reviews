import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_reviews/models/review.dart';
import 'package:covid_reviews/services/auth.dart';


class ReviewService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();
  
  Future<void> addReview(Review review) {
    db
        .collection('stores')
        .doc(review.storeId.toString())
        .collection('reviews')
        .add(({
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
  }

  Future<void> deleteReview() {
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

  
}
