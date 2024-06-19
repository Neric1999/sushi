// Search bar widget
import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 366.87,
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 250, 250),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Vector (3).png',
                width: 18,
              ),
            ),
            suffixIcon: Container(
              alignment: Alignment.center,
              width: 30,
              child: Image.asset(
                'assets/images/Setting.png',
                width: 24,
              ),
            ),
            hintText: 'Search your food',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 162, 161, 161),
              fontSize: 14,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
