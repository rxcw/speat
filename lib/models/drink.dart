import 'package:app_speat/models/product.dart';

class Drink extends Product {
  Drink({
    required String name,
    required double price,
    required String imagePath,
  }) : super(
          name: name,
          price: price,
          imagePath: imagePath,
        );
}
