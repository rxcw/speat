import 'package:app_speat/models/product.dart';

class Sandwich extends Product {
  Sandwich({
    required String name,
    required double price,
    required String imagePath,
  }) : super(
          name: name,
          price: price,
          imagePath: imagePath,
        );
}
