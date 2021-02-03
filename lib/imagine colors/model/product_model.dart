import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const REVIEW = "review";
  static const DATE = "date";
  static const PRICE = "price";
  static const RATING = "rating";

  String _id;
  String _picture;
  String _name;
  String _review;
  DateTime _date;
  double _price;
  double _rating;

  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  String get review => _review;
  DateTime get date => _date;
  double get price => _price;
  double get rating => _rating;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _picture = snapshot.data()[PICTURE];
    _name = snapshot.data()[NAME];
    _review = snapshot.data()[REVIEW];
    _date = snapshot.data()[DATE].toDate();
    
    _price = snapshot.data()[PRICE].toDouble();
    _rating = snapshot.data()[RATING].toDouble();
  }
}
