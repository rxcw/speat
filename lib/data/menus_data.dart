import 'package:app_speat/models/menu.dart';

class MenusData {
  static String path = "assets/images/menus/";
  final String name = "Menus";

  List<Menu> products = [
    Menu(
        name: "Menu Classique",
        price: 12.00,
        drink: null,
        snack: null,
        imagePath: "${path}m1.png"),
    Menu(
        name: "Menu Bacon",
        price: 12.00,
        drink: null,
        snack: null,
        imagePath: "${path}m2.png"),
    Menu(
        name: "Menu Double C",
        price: 14.00,
        drink: null,
        snack: null,
        imagePath: "${path}m3.png"),
    Menu(
        name: "Menu Poulet",
        price: 10.00,
        drink: null,
        snack: null,
        imagePath: "${path}m4.png"),
    Menu(
        name: "Menu Poisson",
        price: 10.00,
        drink: null,
        snack: null,
        imagePath: "${path}m5.png"),
    Menu(
        name: "Menu Double B",
        price: 14.00,
        drink: null,
        snack: null,
        imagePath: "${path}m6.png")
  ];
}
