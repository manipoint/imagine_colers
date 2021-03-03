import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imagine_colers/imagine%20colors/model/spacialist-model.dart';

class ICSpecialistServices{
  String collection = "specialist";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ICSpecialistModel>> getSepcialists() async =>
      _firestore.collection(collection).get().then((value) {
        List<ICSpecialistModel> specialists = [];
        for (DocumentSnapshot specialist in value.docs) {
          specialists.add(ICSpecialistModel.fromSnapshot(specialist));
        }
        return specialists;
      });
  Future<List<ICSpecialistModel>> searchSpecialists({String specialistName}) {
    String searchKey = specialistName[0].toUpperCase() + specialistName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("profession")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((value) {
          List<ICSpecialistModel> specialists = [];
          for (DocumentSnapshot specialist in value.docs) {
            specialists.add(ICSpecialistModel.fromSnapshot(specialist));
          }
          return specialists;
        });
  }
}