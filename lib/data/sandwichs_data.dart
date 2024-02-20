import 'package:app_speat/models/sandwich.dart';

class SandwichsData {
  static String path = "assets/images/sandwichs/";
  final String name = "Sandwichs";

  List<Sandwich> products = [
    Sandwich(name: "Classique", price: 5.00, imagePath: "${path}b1.png"),
    Sandwich(name: "Bacon", price: 5.00, imagePath: "${path}b2.png"),
    Sandwich(name: "Double C", price: 6.00, imagePath: "${path}b3.png"),
    Sandwich(name: "Poulet", price: 4.00, imagePath: "${path}b4.png"),
    Sandwich(name: "Poisson", price: 4.00, imagePath: "${path}b5.png"),
    Sandwich(name: "Double B", price: 6.00, imagePath: "${path}b6.png")
  ];
}
