import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 6,
      shadowColor: const Color.fromARGB(255, 255, 47, 0),
      child: Container(
        alignment: Alignment.center,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: const Color.fromARGB(255, 250, 250, 250),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width: 65,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Image(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 80,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
