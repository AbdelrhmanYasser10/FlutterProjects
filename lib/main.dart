import 'package:facbook_app/screens/feed_screen/android/fedd_screen_android.dart';
import 'package:facbook_app/screens/feed_screen/ios/feed_screen_ios.dart';
import 'package:facbook_app/screens/feed_screen/web/web_feed_screen.dart';
import 'package:facbook_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';

/*The Root Widget For The MediaQuery*/
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp(),));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        /*
        * if the width of screen less than or equal to 767 then display mobile screen , but before that check
        * if we run on android or ios (adaptive)
        * else then run the web screen (responsive)*/
        home: MediaQuery.of(context).size.width <= 767
            ? getOS().toLowerCase() == 'ios'
            ? FeedScreenIOS()
            : FeedScreenAndroid()
            : WebFeedScreen()
    );
  }
}
