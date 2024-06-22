import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const IngredientCard({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 68,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: const Color.fromARGB(255, 250, 250, 250),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 22,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
