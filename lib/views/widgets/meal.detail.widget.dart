import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/views/widgets/category.button.widget.dart';
import 'package:sushi/views/widgets/counter.widget.dart';
import 'package:sushi/views/widgets/image.container.widget.dart';
import 'package:sushi/views/widgets/ingredient.card.dart';
import 'package:sushi/views/widgets/top.bar.widget.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.item,
    required this.img,
    required this.ingredients,
    required this.description,
  });
  final String img;
  final Item item;
  final List<Ingredient> ingredients;
  final String description;

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
                    height: 400,
                  ), // Adjusted to make space for the image
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 270,
                            child: Text(
                              item.name,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 34,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              item.description ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
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
                      Text(
                        item.price.toString(),
                        style: const TextStyle(
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
                          width: 92.w,
                          fntSize: 12.sp,
                          height: 57.h,
                          onTap: () {},
                        ),
                        const SizedBox(width: 24),
                        CategoryButton(
                          imagePath: 'assets/images/⏰.png',
                          text: '10-20 min',
                          isSelected: false,
                          width: 98.w,
                          fntSize: 12.sp,
                          height: 57.h,
                          onTap: () {},
                        ),
                        const SizedBox(width: 24),
                        CategoryButton(
                          imagePath: 'assets/images/Vector (4).png',
                          text: item.reviews.toString(),
                          isSelected: false,
                          width: 92.w,
                          fntSize: 12.sp,
                          height: 57.h,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ingredients
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IngredientCard(
                                  imagePath: e.image, text: e.name),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 380.w,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 100
                          .h), // Added space to avoid overlap with Positioned widget
                ],
              ),
            ),
          ),
          ImageContainer(img: img),

          CounterWidget(
            item: item,
          ),

          TopBar(
            item: item,
          ), // Ensure TopBar is added last in the Stack
        ],
      ),
    );
  }
}
