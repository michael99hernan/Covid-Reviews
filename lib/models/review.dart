import 'package:uuid/uuid.dart';

class Review {
  String authorName;
  double rating;
  String text;
  DateTime time;
  bool wearMask;
  bool sixFeet;
  bool handSani;
  String storeName;
  String storeId;
  Uuid authorId;
  String reviewId;

  Review(
      {this.authorName,
      this.rating,
      this.text,
      this.time,
      this.wearMask,
      this.sixFeet,
      this.handSani,
      this.storeName,
      this.storeId,
      this.authorId,
      this.reviewId});
}
