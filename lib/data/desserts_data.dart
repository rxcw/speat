import 'package:app_speat/models/dessert.dart';

class DessertsData {
  static String path = "assets/images/desserts/";
  final String name = "Desserts";

  List<Dessert> products = [
    Dessert(name: "Fondant Chocolat", price: 2.00, imagePath: "${path}d1.png"),
    Dessert(name: "Muffin Chocolat", price: 2.00, imagePath: "${path}d2.png"),
    Dessert(name: "Donut", price: 2.00, imagePath: "${path}d3.png"),
    Dessert(name: "Milkshake", price: 3.00, imagePath: "${path}d4.png"),
    Dessert(name: "Sundae", price: 4.00, imagePath: "${path}d5.png")
  ];
}
