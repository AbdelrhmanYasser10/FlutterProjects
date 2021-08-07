import 'package:flutter/material.dart';
import 'package:shop_appli/modules/on_boarding_screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

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
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepOrange,
                Colors.red
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Salla',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.white,
                fontSize: 80.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
