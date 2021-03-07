import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imagine_colers/imagine%20colors/helper/constent.dart';
import 'package:imagine_colers/imagine%20colors/model/chekout_model.dart';
import 'package:imagine_colers/imagine%20colors/model/order_model.dart';
import 'package:imagine_colers/imagine%20colors/model/product_model.dart';
import 'package:imagine_colers/imagine%20colors/model/user_model.dart';
import 'package:imagine_colers/imagine%20colors/services/order_services.dart';
import 'package:imagine_colers/imagine%20colors/services/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  UserModel _userModel;

  //gettter

  UserModel get userModel => _userModel;

  Status get status => _status;
  User get user => _user;

  List<OrderModel> orders = [];

  // public variables

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController address = TextEditingController();

  AuthProvider.initialize() {
    _firebaseSetUp();
  }

  _firebaseSetUp() async {
    await initialization.then((value) {
      auth.authStateChanges().listen(_onStateChanged);
    });
  }

  Future<bool> logIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((value) async {
        await preferences.setString("id", value.user.uid);
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> logInWitGoogle() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      _status = Status.Authenticating;
      GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      notifyListeners();
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      preferences.setString("id", googleUser.id);
      _userServices.signInWithCredential(credential);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString("id", result.user.uid);
        _userServices.createUser(
          id: result.user.uid,
          name: name.text,
          email: email.text,
          address: address.text,
          dob: dateOfBirth.text,
        );
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    email.text = "";
    password.text = "";
    address.text = "";
    dateOfBirth.text = "";
  }

  Future<void> reloadUser() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  updateUser(Map<String, dynamic> data) async {
    _userServices.updateUser(data);
  }

  void _onStateChanged(User firebaseUser) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      await preferences.setString("id", firebaseUser.uid);

      _userModel = await _userServices.getUserById(user.uid).then((value) {
        _status = Status.Authenticated;
        return value;
      });
    }
    notifyListeners();
  }

  Future<bool> addToChekout({ProductModel product}) async {
    try {
      var uuid = Uuid();
      String chekoutItemId = uuid.v4();
      List<ChekoutModel> cart = _userModel.chekout;

      Map chekoutItem = {
        "id": chekoutItemId,
        "name": product.name,
        "image": product.picture,
        "productId": product.id,
        "price": product.price,
      };

      ChekoutModel item = ChekoutModel.fromMap(chekoutItem);

      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToChekout(userId: _user.uid, chekoutItem: item);

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromChekout({ChekoutModel chekoutItem}) async {
    print("THE PRODUC remove from: ${chekoutItem.toString()}");

    try {
      _userServices.removeFromChekout(
          userId: _user.uid, chekoutItem: chekoutItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  String validateEmail(String value) {
    value = value.trim();

    if (email.text != null) {
      if (value.isEmpty) {
        return "Please Enter Email to login ";
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return "Enter Correct Email ";
      }
    }
    return null;
  }
}
