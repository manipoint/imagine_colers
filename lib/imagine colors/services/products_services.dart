import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imagine_colers/imagine%20colors/model/product_model.dart';

class ProductServices {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).get().then((value) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in value.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
  Future<List<ProductModel>> searchProducts({String productName}) {
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((value) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in value.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}
