import 'package:flutter/material.dart';
import 'package:covid_reviews/models/store.dart';

class StoreReviews extends StatelessWidget {
  final Store store;

  StoreReviews({this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Image.network(store.imageUrl),
          Container(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(context),
                _subtitle(context),
                _supportingText(context),
              ],
            ),
          ),
          FlatButton(
            child: const Text(
              'REVIEWS',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  // TODO: This will be replaced with Noels review page
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      store.name,
      //some styling
    );
  }

  Widget _subtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          _restaurantsStarWidget(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              '${store.avgRating}',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget _restaurantsStarWidget() {
    var stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      Icon star = i < store.avgRating
          ? Icon(Icons.star, color: Colors.orangeAccent, size: 12)
          : Icon(Icons.star_border, color: Colors.orangeAccent, size: 12);
      stars.add(star);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }

  Widget _supportingText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        store.address,
        //some styling here
      ),
    );
  }
}
