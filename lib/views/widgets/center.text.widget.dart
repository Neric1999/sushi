// Center text widget
import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: Text.rich(
        TextSpan(
          text: 'What do you want for ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Dinner',
              style: TextStyle(
                color: Color(0xFFFF6838),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
