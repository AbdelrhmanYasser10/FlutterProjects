import 'package:flutter/material.dart';
import 'package:villa_app/screens/welcome_screen/wlecome_screen.dart';


void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Villa',
      home: WelcomeScreen(),
    );
  }
}
