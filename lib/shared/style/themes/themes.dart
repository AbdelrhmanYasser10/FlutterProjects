import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_application/shared/style/colors/colors.dart';
import 'package:note_application/shared/style/colors/pallette.dart';


final lightTheme = ThemeData(
  primaryColor: primaryColor,
  backgroundColor: whiteColor,
  brightness: Brightness.light,
  primarySwatch:Palette.kToBlue

);

final darkTheme = ThemeData(
  backgroundColor: darkGreyColor,
  primaryColor: darkGreyColor,
  brightness: Brightness.dark,
  primarySwatch:Palette.kToBlue
);

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
     textStyle: TextStyle(
       fontSize: 24.0,
       fontWeight: FontWeight.bold,
       color: Get.isDarkMode ? Colors.grey.shade400 : Colors.grey,
     ),
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,

    ),
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,

    ),
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey.shade100 : Colors.grey.shade600,

    ),
  );
}

TextStyle get quoteStyle{
  return GoogleFonts.gelasio(
    textStyle: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey.shade100 : Colors.grey.shade600,
    ),
  );
}

TextStyle get authorStyle{
  return GoogleFonts.oswald(
    textStyle: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode ? Colors.grey.shade100 : Colors.grey.shade600,
    ),
  );
}


