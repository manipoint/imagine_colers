import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imagine_colers/imagine%20colors/model/chekout_model.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const DOB = "dob";
  static const ADDRESS = "address";
  static const CHECKOUT = "chekout";
  static const PAYMENT = "payment";

  String _id;
  String _name;
  String _email;
  String _address;
  String _dob;
  double _priceSum = 0;

  //getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get address => _address;
  String get dob => _dob;

  List<ChekoutModel> chekout;
  double totalPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _address = snapshot.data()[ADDRESS];
    _dob = snapshot.data()[DOB];
    chekout = _convertChekoutItems(snapshot.data()[CHECKOUT] ?? []);
    totalPrice = snapshot.data()[CHECKOUT] == null
        ? 0.0
        : getTotalPrice(chekout: snapshot.data()[CHECKOUT]);
  }

  List<ChekoutModel> _convertChekoutItems(List chekout) {
    List<ChekoutModel> convertedChekout = [];
    for (Map chekoutItem in chekout) {
      convertedChekout.add(ChekoutModel.fromMap(chekoutItem));
    }
    return convertedChekout;
  }

  double getTotalPrice({List chekout}) {
    if (chekout == null) {
      return 0;
    }
    for (Map chekoutItem in chekout) {
      _priceSum += chekoutItem["price"];
    }

    double total = _priceSum;
    return total;
  }
}
