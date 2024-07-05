// Center text widget
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Text.rich(
        TextSpan(
          text: 'What do you want for ',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Dinner',
              style: GoogleFonts.playfairDisplay(
                textStyle: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFFFF6838),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
