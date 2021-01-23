import 'package:imagine_colers/imagine%20colors/helper/constent.dart';
import 'package:imagine_colers/imagine%20colors/model/user_model.dart';

class UserServices {

  String users= "users";

  void createUser({String id, String name, String email,String address,String dob}) {
    firebaseFirestore
        .collection(users)
        .doc(id)
        .set({"name": name, "id": id, "email": email,"address":address,"dob":dob});
  }

  void updateUser(Map<String, dynamic> values) {
    firebaseFirestore
        .collection(users)
        .doc(values['id'])
        .update(values);
  }

  Future<UserModel> getUserById(String id) =>
      firebaseFirestore.collection(users).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}