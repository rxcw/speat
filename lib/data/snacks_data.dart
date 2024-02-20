import 'package:app_speat/models/snack.dart';

class SnacksData {
  static String path = "assets/images/snacks/";
  final String name = "Snacks";

  List<Snack> products = [
    Snack(name: "Frites", price: 3.00, imagePath: "${path}s1.png"),
    Snack(name: "Onion rings", price: 3.00, imagePath: "${path}s2.png"),
    Snack(name: "Nuggets", price: 5.00, imagePath: "${path}s3.png"),
    Snack(name: "Cheese ball", price: 5.00, imagePath: "${path}s4.png"),
    Snack(name: "Wings", price: 5.00, imagePath: "${path}s5.png")
  ];
}
