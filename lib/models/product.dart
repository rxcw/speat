class Product {
  String name;
  double price;
  String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
  });

  String get _name => name;
  double get _price => price;
  String get _imagePath => imagePath;
}
