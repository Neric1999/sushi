import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/views/widgets/category.button.widget.dart';
import 'package:sushi/views/widgets/counter.widget.dart';
import 'package:sushi/views/widgets/image.container.widget.dart';
import 'package:sushi/views/widgets/ingredient.card.dart';
import 'package:sushi/views/widgets/top.bar.widget.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.img,
  });
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      height: 400), // Adjusted to make space for the image
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Beef Burger",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Text(
                            'Beef Patty and special sauce',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          r'$',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFF6838),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '7.99',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const SizedBox(width: 24),
                        CategoryButton(
                          imagePath: 'assets/images/⏰.png',
                          text: '10-20 min',
                          isSelected: false,
                          fntSize: 12,
                          width: 100,
                          height: 57,
                          onTap: () {},
                        ),
                        const SizedBox(width: 24),
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
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        IngredientCard(
                          imagePath: 'assets/images/Group.png',
                          text: 'Beef',
                        ),
                        SizedBox(width: 20),
                        IngredientCard(
                          imagePath: 'assets/images/lettuce 1.png',
                          text: 'Lettuce',
                        ),
                        SizedBox(width: 20),
                        IngredientCard(
                          imagePath: 'assets/images/olive-oil 1.png',
                          text: 'Olive Oil',
                        ),
                        SizedBox(width: 20),
                        IngredientCard(
                          imagePath: 'assets/images/🥚.png',
                          text: 'Egg',
                        ),
                        SizedBox(width: 20),
                        IngredientCard(
                          imagePath: 'assets/images/tomato.png',
                          text: 'Tomato',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 380,
                    child: Text(
                      'This special beef burger uses special quality beef with sliced tomatoes, cucumbers, vegetables, lettuce leaf, olive oil and more.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          100), // Added space to avoid overlap with Positioned widget
                ],
              ),
            ),
          ),
          ImageContainer(img: img),

          const CounterWidget(),

          Positioned(
            bottom: 40,
            left: 40,
            height: 70,
            width: 354,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFFFF6838),
              ),
              child: const Text(
                r'Add to Cart ($15.98)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const TopBar(), // Ensure TopBar is added last in the Stack
        ],
      ),
    );
  }
}
