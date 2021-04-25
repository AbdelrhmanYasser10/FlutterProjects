import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Layout/HomeLayout.dart';
import 'Components/block_observer.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TO DO List App",
      home: HomeLayout(),
    );
  }
}