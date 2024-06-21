import 'package:flutter/material.dart';
import 'package:sushi/views/widgets/button.dart';

class ButtonRow extends StatefulWidget {
  const ButtonRow({super.key, required this.onButtonSelected});

  final Function(String) onButtonSelected;

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  String selectedButton = 'Popular';

  void handleButtonTap(String buttonText) {
    setState(() {
      selectedButton = buttonText;
    });
    widget.onButtonSelected(buttonText);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            ['Popular', 'Burgers', 'French Fry', 'Chicken'].map((buttonText) {
          return Row(
            children: [
              Button1(
                txt: buttonText,
                isSelected: selectedButton == buttonText,
                onTap: () {
                  handleButtonTap(buttonText);
                },
                width: 91,
                fntSize: 14,
                fontWeight: FontWeight.bold,
                radius: 16,
                pad: const EdgeInsets.only(left: 0),
                height: 43,
              ),
              const SizedBox(width: 20),
            ],
          );
        }).toList(),
      ),
    );
  }
}
