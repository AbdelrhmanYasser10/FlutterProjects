import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Layout/NewsLayout/news_layout.dart';
import 'package:news_app/Network/dio/dio_helper/dio_helper.dart';
import 'package:news_app/Network/local/shared_refrence/chace.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'Layout/NewsLayout/cubit/observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isLight = CacheHelper.getData(key: 'isLight');

  runApp(MyApp(isLight));
}

class MyApp extends StatelessWidget{

  final bool isLight;

  MyApp(
      this.isLight,
      );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit()..changeAppMode(
        fromShared: isLight,
      ),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){},
        builder:(context,state)=> MaterialApp(
          title: "News",
          home: NewsLayout(),
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromRGBO(196, 154, 2, 1),
                elevation: 20.0
            ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              color: Colors.yellow[600],
              elevation: 0.0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.yellow[600],
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),

          ),
          darkTheme: ThemeData(
            //primarySwatch: Colors.white,
            scaffoldBackgroundColor: HexColor('16213e'),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.white,
              selectedItemColor: HexColor('e94560'),
              elevation: 20.0,
              backgroundColor: HexColor('16213e'),
            ),
            appBarTheme: AppBarTheme(
              color: HexColor('0f3460'),
              elevation: 0.0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: HexColor('0f3460'),
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          themeMode: AppCubit.get(context).isLight ? ThemeMode.light: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}