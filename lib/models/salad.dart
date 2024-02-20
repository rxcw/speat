import 'package:app_speat/models/product.dart';

class Salad extends Product {
  Salad({
    required String name,
    required double price,
    required String imagePath,
  }) : super(
          name: name,
          price: price,
          imagePath: imagePath,
        );
}
