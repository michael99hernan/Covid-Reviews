import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_reviews/services/auth.dart';
import 'package:covid_reviews/shared/appbar.dart';
import 'package:covid_reviews/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateReview extends StatefulWidget {
  @override
  _CreateReviewState createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  // text field state
  String _authorName;
  double _rating = 0.0;
  String _text;
  DateTime _time;
  bool _wearMask = false;
  bool _sixFeet = false;
  bool _handSani = false;
  String _storeName;
  String _storeId = 'kK0yUEMx9hTLZa9xeSFQ';

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(SizedBox(height: 10.0));
    // TODO: Store name will automatically be displayed at the top and
    // store id will be auto put in a hidden field

    //Textbox for store name
    formWidget.add(TextFormField(
      decoration: textInputDecoration.copyWith(hintText: 'Store name'),
      validator: (val) => val.isEmpty ? 'Enter the store name' : null,
      onChanged: (val) {
        setState(() => _storeName = val);
      },
    ));

    formWidget.add(SizedBox(height: 10.0));

    // //Textbox for store Id
    // formWidget.add(
    //   TextFormField(

    //     decoration: textInputDecoration.copyWith(hintText: 'Store Id'),
    //     validator: (val) => val.isEmpty ? 'Enter a store Id' : null,
    //     onChanged: (val) {
    //       setState(() => _storeId = val);
    //     },
    //   ),
    // );
    // formWidget.add(SizedBox(height: 10.0));

    //Textbox for author name
    // formWidget.add(TextFormField(
    //   decoration: textInputDecoration.copyWith(hintText: 'Author name'),
    //   validator: (val) => val.isEmpty ? 'Enter the author name' : null,
    //   onChanged: (val) {
    //     setState(() => _authorName = val);
    //   },
    // ));
    // formWidget.add(SizedBox(height: 10.0));

    //Rating
    formWidget.add(Center(
      child: Text(
        'Rating',
        style: TextStyle(fontSize: 25),
      ),
    ));
    formWidget.add(Slider(
        value: _rating,
        divisions: 5,
        min: 0,
        max: 5,
        label: _rating.round().toString(),
        onChanged: (double val) {
          setState(() {
            _rating = val;
          });
        }));

    formWidget.add(SizedBox(height: 10.0));

    //Checkbox for wear mask
    formWidget.add(CheckboxListTile(
      title: Text('Do employees wear mask?'),
      value: _wearMask,
      onChanged: (bool val) {
        setState(() {
          _wearMask = val;
        });
      },
    ));

    //Checkbox for six feet signs
    formWidget.add(CheckboxListTile(
      title: Text('Does store have six feet signs?'),
      value: _sixFeet,
      onChanged: (bool val) {
        setState(() {
          _sixFeet = val;
        });
      },
    ));

    //Checkbox for hand sani
    formWidget.add(CheckboxListTile(
      title: Text('Do store have hand sanitizer?'),
      value: _handSani,
      onChanged: (bool val) {
        setState(() {
          _handSani = val;
        });
      },
    ));

    formWidget.add(SizedBox(height: 10.0));

    //Textbox for review text
    formWidget.add(
      TextFormField(
        maxLength: 200,
        maxLines: 5,
        decoration: textInputDecoration.copyWith(hintText: 'Review'),
        validator: (val) => val.isEmpty ? 'Enter a review for the store' : null,
        onChanged: (val) {
          setState(() => _text = val);
        },
      ),
    );

    // TODO : Send the form to the firestore. This will be done by calling the review service create method
    // the onpressed will have to be changed to an async method

    formWidget.add(
      RaisedButton(
          color: Colors.green,
          child: Text(
            'Submit Review',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              setState(() => _time = DateTime.now());
              print('Submit review button pressed');
              print(_time);
              User user = _authService.initUser();
              _authorName = user.displayName;
              // TODO: Replace with service call
              FirebaseFirestore.instance
                  .collection('stores')
                  .doc(_storeId)
                  .collection('reviews')
                  .add({
                'authorName': _authorName,
                'rating': _rating,
                'text': _text,
                'datePublished': _time,
                'wearMask': _wearMask,
                'sixFeet': _sixFeet,
                'handSani': _handSani,
                'storeName': _storeName,
                'storeId': _storeId,
              });
            }
          }),
    );
    return formWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(
        "Write a Review",
        null,
        null,
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
        ),
      ),
    );
  }
}
