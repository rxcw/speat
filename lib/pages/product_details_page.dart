import 'package:app_speat/components/arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:app_speat/models/shop.dart';
import 'package:app_speat/theme/colors.dart';

class ProductDetailsPage extends StatefulWidget {
  final dynamic product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantityCount = 1;

  void decrementQuantity() {
    if (quantityCount > 1) {
      setState(() {
        quantityCount--;
      });
    }
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    final shop = context.read<Shop>();

    shop.addToCart(widget.product, quantityCount);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: primaryColor,
        content: const Text("Ajouté au panier avec succès",
            style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(Icons.done, color: Colors.white))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.product.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  Text(widget.product.name,
                      style: GoogleFonts.poppins(fontSize: 28)),
                  const SizedBox(height: 25),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur felis risus, tincidunt quis justo non, tincidunt rutrum urna. Donec luctus sem elit, at rhoncus neque semper eu. Integer ut lorem vel orci scelerisque semper nec sit amet sapien. Mauris bibendum mattis orci, ac pretium metus pretium accumsan. Donec interdum laoreet lobortis. Phasellus fringilla ex quis lorem viverra iaculis.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFFe85d04), Color(0xFFf48c06)],
              ),
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${(widget.product.price * quantityCount).toStringAsFixed(2)}€",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              icon:
                                  const Icon(Icons.remove, color: Colors.white),
                              onPressed: decrementQuantity),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: incrementQuantity),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                MyArrowButton(onTap: addToCart, text: "Ajouter au panier")
              ],
            ),
          )
        ],
      ),
    );
  }
}
