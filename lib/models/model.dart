import 'package:covid_19_app/screens/home_screen/home_screen.dart';
import '../screens/statistics_screen/statistics_screen.dart';
import 'package:covid_19_app/shared/colors.dart';
import 'package:flutter/material.dart';

List<Widget>screens = [
  HomeScreen(),
  StatisticsScreen(),
];

Map<String, double> dataMap = {
  "Affected": 336851,
  "Death": 9620,
  "Recovered": 17977,
  "Active": 301251,
  "Serious":8702
};

List<Color>colorsList=[
  warningColor,
  dangerColor,
  successColor,
  infoColor,
  primaryColor,
];

List<String> imgUrls=[
  "https://image.flaticon.com/icons/png/512/3107/3107654.png",
  "https://image.flaticon.com/icons/png/512/5060/5060292.png",
  "https://image.flaticon.com/icons/png/512/3579/3579773.png",
];
List<String> textUnderImage =[
  "Avoid close\ncontact",
  "Clean your\nhands often",
  "Wear a\nfacemask",
];

Widget preventionContent(int index)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Column(
    children: [
        CircleAvatar(
          radius: 65.0,
          backgroundColor: Colors.white,
          child: Image(
            image: NetworkImage(imgUrls[index]),
          ),
        ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        textUnderImage[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
);