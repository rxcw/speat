import 'package:flutter/material.dart';
import 'package:app_speat/models/category.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTile extends StatelessWidget {
  final FoodCategory category;
  final void Function()? onTap;
  final bool isLastItem;

  const CategoryTile(
      {Key? key,
      required this.category,
      required this.isLastItem,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: 25, right: isLastItem ? 25 : 0),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              category.imagePath,
              height: 70,
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              style: GoogleFonts.poppins(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
