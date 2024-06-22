import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
          InkWell(
            // Ensure this is also an InkWell
            onTap: () {
              // Your onTap action here
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
                'assets/images/Heart.png',
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
