import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/layout/weather_layout/wather_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  void navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 6000),(){});
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>WeatherLayout()), (route) => false);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xe1f5fe).withOpacity(1.0),
      body: Center(child: Image(image: AssetImage('assets/images/weather-app-icon-20.jpg'), width: MediaQuery.of(context).size.width/3,)),
);
  }
}
