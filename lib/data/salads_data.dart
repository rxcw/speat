import 'package:app_speat/models/salad.dart';

class SaladsData {
  static String path = "assets/images/salads/";
  final String name = "Salades";

  List<Salad> products = [
    Salad(name: "Salade 1", price: 5.00, imagePath: "${path}sa1.png"),
    Salad(name: "Salade 2", price: 5.00, imagePath: "${path}sa2.png"),
    Salad(name: "Salade 3", price: 5.00, imagePath: "${path}sa3.png"),
    Salad(name: "Salade 4", price: 5.00, imagePath: "${path}sa4.png"),
    Salad(name: "Salade 5", price: 5.00, imagePath: "${path}sa5.png")
  ];
}
