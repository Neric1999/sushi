import 'package:flutter/material.dart';

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
          Container(
            height: 350,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
