import 'package:app_speat/theme/colors.dart';
import 'package:flutter/material.dart';

class MyArrowButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyArrowButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
