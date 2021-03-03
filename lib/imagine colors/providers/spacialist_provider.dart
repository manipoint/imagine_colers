import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/spacialist-model.dart';
import 'package:imagine_colers/imagine%20colors/services/spacialist_services.dart';

class IcSpecialistProvider extends ChangeNotifier {
  ICSpecialistServices _services = ICSpecialistServices();
  List<ICSpecialistModel> products = [];
  List<ICSpecialistModel> search = [];

  IcSpecialistProvider.initialize() {
    loadProduct();
    // searchProduct();
  }

  loadProduct() async {
    products = await _services.getSepcialists();
    notifyListeners();
  }

  void searchProduct({String name}) async {
    search = await _services.searchSpecialists();
    notifyListeners();
  }
}
