import 'package:app_speat/models/product.dart';

class Dessert extends Product {
  Dessert({
    required String name,
    required double price,
    required String imagePath,
  }) : super(
          name: name,
          price: price,
          imagePath: imagePath,
        );
}
