import 'package:app_speat/data/menus_data.dart';
import 'package:app_speat/data/sandwichs_data.dart';
import 'package:app_speat/data/drinks_data.dart';
import 'package:app_speat/data/snacks_data.dart';
import 'package:app_speat/data/salads_data.dart';
import 'package:app_speat/data/desserts_data.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
  final List<dynamic> _allProducts = [
    ...MenusData().products,
    ...SandwichsData().products,
    ...DrinksData().products,
    ...SnacksData().products,
    ...SaladsData().products,
    ...DessertsData().products
  ];

  List<dynamic> _cart = [];

  List<dynamic> get allProducts => _allProducts;
  List<dynamic> get cart => _cart;

  void addToCart(dynamic product, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(dynamic product) {
    _cart.remove(product);
    notifyListeners();
  }
}
