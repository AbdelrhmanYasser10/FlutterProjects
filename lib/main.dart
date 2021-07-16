import 'package:flutter/material.dart';
import 'file:///D:/MSP/MSPFlutter/TrainProject/netflix_ui_app/lib/layout/main_layout.dart';
import 'models/models.dart';


void main(){
  initAllMoviesAndSeries();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NETFLIX',
      home: MainLayout(),
    );
  }
}
