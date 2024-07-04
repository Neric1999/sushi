import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/repo/provider/brands.provider.dart';
import 'package:sushi/views/widgets/brand.card.widget.dart';
import 'package:sushi/views/widgets/category.button.widget.dart';
import 'package:sushi/views/widgets/center.text.widget.dart';
import 'package:sushi/views/widgets/header.widget.dart';
import 'package:sushi/views/widgets/search.bar.widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedCategory = 'Burger';

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brands = ref.watch(brandProvider);
    final searchTerm = ref.watch(searchProvider);

    final filteredBrands = searchTerm.isEmpty
        ? brands
        : brands
            .where((brand) =>
                brand.name.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Categories',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
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
                children: filteredBrands
                    .where((brand) => brand.name.contains(selectedCategory))
                    .map((brand) {
                  return Column(
                    children: [
                      BrandCard(
                        brand: brand,
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
