import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/modules/login_screen/login_screen.dart';
import 'package:instagram_clone/shared/colors/colors.dart';
import 'package:instagram_clone/shared/providers/user_provider/user_provider.dart';
import 'package:instagram_clone/Layout/responsive/mobile_screen_layout/mobile_screen_layout.dart';
import 'package:instagram_clone/Layout/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/Layout/responsive/web_screen_layout/web_screen_layout.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(
     options:const FirebaseOptions(
         apiKey: "AIzaSyAaOmGjFYYzRCXFVhiyoHPNgsLVuwktzMM",
         appId: "1:346693402500:web:fb9231a2dfc2d2d242e7d1",
         messagingSenderId: "346693402500",
         projectId: "instagram-clone-90032",
         storageBucket:"instagram-clone-90032.appspot.com",
     ),
   ); 
  }
  else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider()),

      ],
      child: MaterialApp(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: mobileBackgroundColor,
          fontFamily: 'JosefinSans',

        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapShot){
            if(snapShot.connectionState == ConnectionState.active){
              if(snapShot.hasData){
                return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                );
              }
              else if(snapShot.hasError){
                return Center(
                  child: Text(
                    snapShot.error.toString()
                  ),
                );
              }
            }
            if(snapShot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
