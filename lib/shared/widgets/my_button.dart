import 'package:flutter/material.dart';
import '../style/colors/colors.dart';

class MyButton extends StatelessWidget {
  final VoidCallback function;
  final String label;
  const MyButton({Key? key , required this.function , required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 100.0,
        height: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
