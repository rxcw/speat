import 'package:app_speat/models/drink.dart';

class DrinksData {
  static String path = "assets/images/drinks/";
  final String name = "Boissons";

  List<Drink> products = [
    Drink(name: "Coca-Cola", price: 2.00, imagePath: "${path}bo1.png"),
    Drink(name: "Coca-Cola Light", price: 2.00, imagePath: "${path}bo2.png"),
    Drink(name: "Coca-Cola Zero", price: 2.00, imagePath: "${path}bo3.png"),
    Drink(name: "Fanta", price: 2.00, imagePath: "${path}bo4.png"),
    Drink(name: "Sprite", price: 2.00, imagePath: "${path}bo5.png"),
    Drink(name: "Ice Tea", price: 2.00, imagePath: "${path}bo6.png")
  ];
}
