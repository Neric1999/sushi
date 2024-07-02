import 'package:flutter/material.dart';
import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/views/widgets/food.card.widget.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;

  const BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Material(
        elevation: 5,
        color: Colors.white,
        shadowColor: const Color.fromARGB(255, 237, 87, 41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/${brand.logo}',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    brand.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: brand.items.map((item) {
                return FoodCard(
                  imagePath: item.image,
                  brand: brand,
                  title: item.name,
                  subtitle: item.description ?? '',
                  rating: item.reviews ?? 0.0,
                  time: item.prepTime,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
