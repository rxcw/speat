import 'package:app_speat/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:app_speat/data/menus_data.dart';
import 'package:app_speat/data/sandwichs_data.dart';
import 'package:app_speat/data/drinks_data.dart';
import 'package:app_speat/data/snacks_data.dart';
import 'package:app_speat/data/salads_data.dart';
import 'package:app_speat/data/desserts_data.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  final int index;
  const CategoryPage({Key? key, required this.index}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<dynamic> allProductsData = [
    MenusData(),
    SandwichsData(),
    DrinksData(),
    SnacksData(),
    SaladsData(),
    DessertsData()
  ];

  void navigateToProductDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
                product: allProductsData[widget.index].products[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allProductsData[widget.index].name),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: allProductsData[widget.index].products.length,
        itemBuilder: (context, index) {
          final isLastItem =
              index == allProductsData[widget.index].products.length - 1;
          final product = allProductsData[widget.index].products[index];

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
      ),
    );
  }
}
