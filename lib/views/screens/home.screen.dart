import 'package:flutter/material.dart';
import 'package:sushi/views/widgets/category.button.widget.dart';
import 'package:sushi/views/widgets/center.text.widget.dart';
import 'package:sushi/views/widgets/food.card.widget.dart';
import 'package:sushi/views/widgets/header.widget.dart';
import 'package:sushi/views/widgets/search.bar.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Burger';

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 23),
              const CenterText(),
              const SizedBox(height: 20),
              const SearchBarCustom(),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CategoryButton(
                        imagePath: 'assets/images/🍔.png',
                        text: 'Burger',
                        isSelected: selectedCategory == 'Burger',
                        onTap: () => selectCategory('Burger'),
                      ),
                      const SizedBox(width: 20),
                      CategoryButton(
                        imagePath: 'assets/images/Group 5.png',
                        text: 'Pizza',
                        isSelected: selectedCategory == 'Pizza',
                        onTap: () => selectCategory('Pizza'),
                      ),
                      const SizedBox(width: 20),
                      CategoryButton(
                        imagePath: 'assets/images/🥙.png',
                        text: 'Salad',
                        isSelected: selectedCategory == 'Salad',
                        onTap: () => selectCategory('Salad'),
                      ),
                      const SizedBox(width: 20),
                      CategoryButton(
                        imagePath:
                            'assets/images/chicken-meat-buffalo-wing-raw-foodism-chicken-b41999528445be3ef377613e6e7186a9.png',
                        text: 'Pork',
                        isSelected: selectedCategory == 'Pork',
                        onTap: () => selectCategory('Pork'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 64),
              const FoodCard(
                imagePath: 'assets/images/image 26.png',
                title: 'Chillox Burger',
                subtitle: 'Burgers Fast Food',
                rating: 4.8,
                time: '10 min',
              ),
              const SizedBox(height: 20),
              const FoodCard(
                imagePath: 'assets/images/image 26.png',
                title: 'Chillox Burger',
                subtitle: 'Burgers Fast Food',
                rating: 4.8,
                time: '10 min',
              ),
              const SizedBox(height: 20),
              const FoodCard(
                imagePath: 'assets/images/deliciou.jpeg',
                title: 'Chillox Burger',
                subtitle: 'Burgers Fast Food',
                rating: 4.8,
                time: '10 min',
              ),
              const SizedBox(height: 20),
              const FoodCard(
                imagePath: 'assets/images/hot.png',
                title: 'Chillox Burger',
                subtitle: 'Burgers Fast Food',
                rating: 4.8,
                time: '10 min',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
