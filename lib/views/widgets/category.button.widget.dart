// Category button widget
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryButton extends StatelessWidget {
  String? imagePath;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? fntSize;

  CategoryButton({
    this.imagePath,
    required this.text,
    this.width,
    this.fntSize,
    this.height,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(19),
      child: Container(
        height: height ?? 56,
        width: width ?? 102,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: isSelected
              ? const Color(0xFFFF6838)
              : const Color.fromARGB(255, 250, 250, 250),
        ),
        child: Row(
          children: [
            Container(
              width: imagePath != null ? 27 : 0,
              height: imagePath != null ? 27 : 0,
              margin: const EdgeInsets.only(left: 9),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
              ),
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      width: 18,
                    )
                  : Text(''),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: fntSize ?? 14,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
