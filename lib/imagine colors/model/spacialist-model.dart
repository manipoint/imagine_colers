import 'package:cloud_firestore/cloud_firestore.dart';

class ICSpecialistModel{
   static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const ABOUT = "about";
  static const  PROFESSION= "profession";
  

  String _id;
  String _picture;
  String _name;
  String _about;
  List _profession; 

  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  String get about => _about;
  List get profession => _profession;
  

  ICSpecialistModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _picture = snapshot.data()[PICTURE];
    _name = snapshot.data()[NAME];
    _about = snapshot.data()[ABOUT];
    _profession = snapshot.data()[PROFESSION];

  }
}