import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indexed/indexed.dart';
import 'package:sushi/views/widgets/category.button.widget.dart';

class CustomIndexer extends StatelessWidget {
  const CustomIndexer({super.key});

  @override
  Widget build(BuildContext context) {
    return Indexer(
      children: [
        Positioned(
          top: 202,
          left: 30,
          child: Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              height: 181,
              width: 354,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(
                      'Chillox Burger',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryButton(
                            imagePath: 'assets/images/🛵.png',
                            text: 'Free',
                            isSelected: false,
                            width: 100,
                            height: 57,
                            fntSize: 12,
                            onTap: () {},
                          ),
                          CategoryButton(
                            imagePath: 'assets/images/⏰.png',
                            text: '10-20 min',
                            isSelected: false,
                            fntSize: 12,
                            width: 100,
                            height: 57,
                            onTap: () {},
                          ),
                          CategoryButton(
                            imagePath: 'assets/images/Vector (4).png',
                            text: '4.8',
                            isSelected: false,
                            width: 100,
                            fntSize: 12,
                            height: 57,
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 147,
          left: 153,
          child: Material(
            elevation: 15,
            shadowColor: const Color.fromARGB(255, 233, 23, 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(55),
            ),
            child: Image.asset(
              'assets/images/image 8.png',

              width: 107, // Ensure the image fits the container properly
            ),
          ),
        )
      ],
    );
  }
}
