import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/shared/colors/colors.dart';


ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: defaultLightThemeColor,
  primaryColor: primarySwatchLightColor,
  splashColor: defaultLightThemeColor,
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: defaultLightThemeColor,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: defaultLightThemeColor,
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      color: Colors.black,

    ),
  ),
  fontFamily: 'MontserratAlternates',
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: defaultDarkThemeColor,
  primaryColor: primarySwatchDarkColor,
  splashColor: defaultDarkThemeColor,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: defaultDarkThemeColor,
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: defaultDarkThemeColor,
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      color: Colors.white,

    ),
  ),
  fontFamily: 'MontserratAlternates',
);