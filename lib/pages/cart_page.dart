import 'package:app_speat/components/arrow_button.dart';
import 'package:app_speat/models/shop.dart';
import 'package:app_speat/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(dynamic product, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              title: const Text("Mon Panier"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      final dynamic product = value.cart[index];

                      final String productName = product.name;

                      final double productPrice = product.price;

                      return Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        margin:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: ListTile(
                          title: Text(productName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text("${productPrice.toStringAsFixed(2)}€",
                              style: TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () => removeFromCart(product, context),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(20), // Adjust the value as needed
                  child: MyButton(
                    onTap: () {},
                    text: "Payer",
                  ),
                ),
              ],
            )));
  }
}
