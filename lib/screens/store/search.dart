import 'dart:async';

import 'package:covid_reviews/models/store.dart';
import 'package:covid_reviews/shared/appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covid_reviews/credentials.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class SearchStore extends StatefulWidget {
  @override
  _SearchStoreState createState() => _SearchStoreState();
}

class _SearchStoreState extends State<SearchStore> {
  TextEditingController _searchController = new TextEditingController();
  Timer _throttle;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChange);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChange);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChange() {
    if (_throttle?.isActive ?? false) _throttle.cancel();
    _throttle = Timer(const Duration(milliseconds: 500), () {
      getStoreResults(_searchController.text);
    });
  }

  void getStoreResults(String input) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=';

    String type = 'establishment';
    // TODO: add session token

    String request = '$baseURL$input&key=$PLACES_API_KEY&type=$type';

    Response response = await Dio().get(request);

    final predictions = response.data['predictions'];

    List<Store> _displayResults = [];
    //print(predictions);
    for (var i = 0; i < predictions.length; i++) {
      String name = predictions[i]['structured_formatting']['main_text'];
      String id = predictions[i]['place_id'];
      String address =
          predictions[i]['structured_formatting']['secondary_text'];
      _displayResults
          .add(Store(name: name, id: id, address: address, avgRating: 0.0));
    }

    for (var stores in _displayResults) {
      print(stores.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'Search for Stores',
        null,
        null,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefix: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
