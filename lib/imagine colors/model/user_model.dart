import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const DOB = "dob";
  static const ADDRESS = "address";

  String _id;
  String _name;
  String _email;
  String _address;
  String _dob;

  //getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get address => _address;
  String get dob => _dob;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _address = snapshot.data()[ADDRESS];
    _dob = snapshot.data()[DOB];
  }
}
