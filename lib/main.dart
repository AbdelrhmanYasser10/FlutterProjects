import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/shared/themes/themes.dart';
import 'modules/splash_screen/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocProvider(
        create: (context) => WeatherCubit()..getWeatherData(),
        child: BlocConsumer<WeatherCubit, WeatherStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              darkTheme: darkTheme,
              theme: lightTheme,
              themeMode: ThemeMode.light,
            );
          },
        ),
    );
  }
}