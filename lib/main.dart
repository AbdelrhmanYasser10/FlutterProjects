import 'package:flutter/material.dart';

import 'Layout/mainLayout.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme:ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}
