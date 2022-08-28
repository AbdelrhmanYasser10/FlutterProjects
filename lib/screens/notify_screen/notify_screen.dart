import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/shared/style/colors/colors.dart';

import '../../shared/style/themes/themes.dart';


class NotifyScreen extends StatelessWidget {
  final String label;
  const NotifyScreen({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?darkGreyColor : Colors.white,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            color: Get.isDarkMode?Colors.white:Colors.grey,
          ),
        ),
        title: Text(
            label.toString().split("|")[0],
          style: subTitleStyle,
        ),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Get.isDarkMode?Colors.white:Colors.grey.shade400
          ),
          child: Center(
            child: Text(
                label.toString().split("|")[1],
              style: titleStyle,
            ),
          ),
        ),
      ),
    );
  }
}
