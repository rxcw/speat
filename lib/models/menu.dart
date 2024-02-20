import 'package:app_speat/models/drink.dart';
import 'package:app_speat/models/snack.dart';

class Menu {
  String name;
  double price;
  String imagePath;

  Drink? drink;
  Snack? snack;

  Menu(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.drink,
      required this.snack});

  String get _name => name;
  double get _price => price;
  String get _imagePath => imagePath;
}
