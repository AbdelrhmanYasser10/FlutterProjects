import 'package:flutter/material.dart';

class TextFieldLayout extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldLayout(
      {Key? key,
      required this.textInputType,
      required this.textEditingController,
      required this.hintText,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color:Colors.grey.shade400,
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        fillColor: Colors.grey.shade900,
        contentPadding: const EdgeInsets.all(6),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
