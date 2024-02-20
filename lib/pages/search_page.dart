import 'package:app_speat/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:app_speat/data/menus_data.dart';
import 'package:app_speat/data/sandwichs_data.dart';
import 'package:app_speat/data/drinks_data.dart';
import 'package:app_speat/data/snacks_data.dart';
import 'package:app_speat/data/salads_data.dart';
import 'package:app_speat/data/desserts_data.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  final String search;
  const SearchPage({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> allProductsData = [
      MenusData(),
      SandwichsData(),
      DrinksData(),
      SnacksData(),
      SaladsData(),
      DessertsData()
    ];

    List<dynamic> filteredProducts = [];

    void navigateToProductDetails(int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailsPage(product: filteredProducts[index])));
    }

    for (var category in allProductsData) {
      category.products.forEach((product) {
        if (product.name.toLowerCase().contains(search.toLowerCase())) {
          filteredProducts.add(product);
        }
      });
    }

    Widget buildProductList() {
      return ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];

          return GestureDetector(
            onTap: () => navigateToProductDetails(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        product.imagePath,
                        height: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${product.price.toStringAsFixed(2)}€",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche"),
      ),
      body: filteredProducts.isEmpty && search.isNotEmpty
          ? const Center(
              child: Text(
                "Aucun produit trouvé",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Visibility(
              visible: search.isNotEmpty,
              replacement: const Center(
                child: Text(
                  "Entrez un terme de recherche",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              child: buildProductList(),
            ),
    );
  }
}
