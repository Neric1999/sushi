import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/domain/models/meal.model.dart';
import 'package:sushi/repo/provider/cart.items.provider.dart';
import 'package:sushi/views/widgets/button_row.dart';
import 'package:sushi/views/widgets/custom.indexer.dart';
import 'package:sushi/views/widgets/menu_item.dart';

class SingleMeal extends ConsumerStatefulWidget {
  const SingleMeal({super.key, required this.image});

  final String image;

  @override
  ConsumerState<SingleMeal> createState() => _SingleMealState();
}

class _SingleMealState extends ConsumerState<SingleMeal> {
  @override
  Widget build(BuildContext context) {
    final cartItemCount = ref.watch(cartProvider).length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 293,
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 293,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          Positioned(
            top: 52,
            left: 30,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/Vector (5).png',
                      width: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 244),
                Stack(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/‌Bag - 3.png',
                        width: 24,
                      ),
                    ),
                    if (cartItemCount > 0)
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$cartItemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const CustomIndexer(),
          Positioned(
            top: 408,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Menu',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: ButtonRow(
                    onButtonSelected: (buttonText) {
                      // Handle button selection
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 468,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      const List<MealModel> menuItems = [
                        MealModel(
                          img: 'assets/images/image-removebg-preview (4).png',
                          title: 'Chicken Burger',
                          subtitle: 'Chicken Patty and special sauce',
                          price: 4.99,
                        ),
                        MealModel(
                          img: 'assets/images/image-removebg-preview (5).png',
                          title: 'Beef Burger',
                          subtitle: 'Beef Patty and special sauce',
                          price: 7.99,
                        ),
                        MealModel(
                          img: 'assets/images/fries.png',
                          title: 'French Fry',
                          subtitle: 'Crispy and golden',
                          price: 2.99,
                        ),
                        MealModel(
                          img: 'assets/images/file (1).png',
                          title: 'Chicken Drumsticks',
                          subtitle: 'Juicy and tender',
                          price: 5.99,
                        ),
                      ];

                      var item = menuItems[index];

                      return MenuItem(
                        image: item.img,
                        title: item.title,
                        subtitle: item.subtitle,
                        price: item.price,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
