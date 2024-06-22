import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String img;

  const ImageContainer({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
