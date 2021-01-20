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
  Uuid storeId;

  Review(
      {this.authorName,
      this.rating,
      this.text,
      this.time,
      this.wearMask,
      this.sixFeet,
      this.handSani,
      this.storeName,
      this.storeId});
}
