import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_appli/layout/main_layout/main_layout.dart';
import 'package:shop_appli/modules/log_in_screen/login_screen.dart';
import 'package:shop_appli/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:shop_appli/shared/network/local/cache_helper.dart';

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
    bool onBoarding = CacheHelper.getData(key: 'onBoarding') == null?false:CacheHelper.getData(key: 'onBoarding');
    String? login = CacheHelper.getData(key: 'token');
    await Future.delayed(Duration(milliseconds: 6000),(){});
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>onBoarding?login==null?LogInScreen():ShopLayout():OnBoardingScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.deepOrangeAccent,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
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
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1!
                    .copyWith(
                  color: Colors.white,
                  fontSize: 80.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
