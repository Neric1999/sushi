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

  final Map<String, List<Map<String, String>>> foodItems = {
    'Burger': [
      {
        'imagePath': 'assets/images/image 26.png',
        'title': 'Chillox Burger',
        'subtitle': 'Burgers Fast Food',
        'rating': '4.8',
        'time': '10 min',
      },
      {
        'imagePath': 'assets/images/image 26.png',
        'title': 'Chillox Burger',
        'subtitle': 'Burgers Fast Food',
        'rating': '4.8',
        'time': '10 min',
      },
      {
        'imagePath': 'assets/images/deliciou.jpeg',
        'title': 'Delicious Pizza',
        'subtitle': 'Pizza Fast Food',
        'rating': '4.7',
        'time': '15 min',
      },
      {
        'imagePath': 'assets/images/hot.png',
        'title': 'Hot Pizza',
        'subtitle': 'Pizza Fast Food',
        'rating': '4.6',
        'time': '12 min',
      },
    ],
    'Pizza': [
      {
        'imagePath': 'assets/images/p1.jpg',
        'title': 'Delicious Pizza',
        'subtitle': 'Pizza Fast Food',
        'rating': '4.7',
        'time': '15 min',
      },
      {
        'imagePath': 'assets/images/p3.jpg',
        'title': 'Hot Pizza',
        'subtitle': 'Pizza Fast Food',
        'rating': '4.6',
        'time': '12 min',
      },
      {
        'imagePath': 'assets/images/p4.jpeg',
        'title': 'Hot Pizza',
        'subtitle': 'Pizza Fast Food',
        'rating': '4.6',
        'time': '12 min',
      },
    ],
    'Salad': [
      {
        'imagePath': 'assets/images/s1.jpg',
        'title': 'Caesar Salad',
        'subtitle': 'Healthy Food',
        'rating': '4.9',
        'time': '8 min',
      },
      {
        'imagePath': 'assets/images/s2.jpg',
        'title': 'Greek Salad',
        'subtitle': 'Healthy Food',
        'rating': '4.7',
        'time': '9 min',
      },
      {
        'imagePath': 'assets/images/s3.jpeg',
        'title': 'Greek Salad',
        'subtitle': 'Healthy Food',
        'rating': '4.7',
        'time': '9 min',
      },
      {
        'imagePath': 'assets/images/s4.jpg',
        'title': 'Greek Salad',
        'subtitle': 'Healthy Food',
        'rating': '4.7',
        'time': '9 min',
      },
    ],
    'Pork': [
      {
        'imagePath': 'assets/images/pork1.jpg',
        'title': 'BBQ Pork Ribs',
        'subtitle': 'Grilled Food',
        'rating': '4.8',
        'time': '20 min',
      },
      {
        'imagePath': 'assets/images/pork2.jpg',
        'title': 'Roast Pork',
        'subtitle': 'Grilled Food',
        'rating': '4.7',
        'time': '18 min',
      },
      {
        'imagePath': 'assets/images/pork4.jpg',
        'title': 'Roast Pork',
        'subtitle': 'Grilled Food',
        'rating': '4.7',
        'time': '18 min',
      },
      {
        'imagePath': 'assets/images/pork3.jpg',
        'title': 'Roast Pork',
        'subtitle': 'Grilled Food',
        'rating': '4.7',
        'time': '18 min',
      },
    ],
  };

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
                        imagePath: 'assets/images/capocollo.jpg',
                        text: 'Pork',
                        isSelected: selectedCategory == 'Pork',
                        onTap: () => selectCategory('Pork'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Column(
                children: foodItems[selectedCategory]!.map((foodItem) {
                  return Column(
                    children: [
                      FoodCard(
                        imagePath: foodItem['imagePath']!,
                        title: foodItem['title']!,
                        subtitle: foodItem['subtitle']!,
                        rating: double.parse(foodItem['rating']!),
                        time: foodItem['time']!,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
