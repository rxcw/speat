import 'package:app_speat/models/category.dart';

class CategoriesData {
  static String path = "assets/images/";

  static List<FoodCategory> categories = [
    FoodCategory(name: "Menus", imagePath: "${path}menus/m1.png"),
    FoodCategory(name: "Sandwichs", imagePath: "${path}sandwichs/b1.png"),
    FoodCategory(name: "Boissons", imagePath: "${path}drinks/bo1.png"),
    FoodCategory(name: "Snacks", imagePath: "${path}snacks/s2.png"),
    FoodCategory(name: "Salades", imagePath: "${path}salads/sa1.png"),
    FoodCategory(name: "Desserts", imagePath: "${path}desserts/d1.png")
  ];
}
