import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/product_model.dart';
import 'package:imagine_colers/imagine%20colors/services/products_services.dart';

class ICProductProviders extends ChangeNotifier {
  ProductServices _services = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> search = [];

  ICProductProviders.initialize() {
    loadProduct();
   // searchProduct();
  }

  loadProduct() async {
    products = await _services.getProducts();
    notifyListeners();
  }

  void searchProduct({String name}) async {
    search = await _services.searchProducts();
    notifyListeners();
  }
}
