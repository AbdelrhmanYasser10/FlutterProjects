import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/shared/style/themes/themes.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0
            ),
            child: TextFormField(
              autofocus: false,
              cursorColor:
                  Get.isDarkMode ? Colors.grey.shade100 : Colors.grey.shade700,
              controller: controller,
              readOnly: widget== null ? false : true,
              style: subTitleStyle,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: subTitleStyle,
                suffixIcon: widget ?? const SizedBox(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade700, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade700, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade700, width: 1.0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade700, width: 1.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
