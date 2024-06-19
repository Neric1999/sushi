// Header widget
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: const Color.fromARGB(255, 250, 250, 250),
            ),
            child: Image.asset(
              'assets/images/Sort.png',
              width: 24,
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/Location.png',
            width: 24,
          ),
          const SizedBox(width: 5),
          const Text(
            'Dhaka,BD',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Image.asset(
            'assets/images/Arrow - Bottom.png',
            width: 24,
          ),
          const Spacer(),
          Container(
            height: 55,
            width: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: const Color.fromARGB(255, 250, 250, 250),
            ),
            child: Image.asset(
              'assets/images/Notification.png',
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
