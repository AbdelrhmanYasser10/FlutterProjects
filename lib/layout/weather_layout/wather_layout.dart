import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/modules/home_screen/home_screen.dart';
import 'package:weather_app/modules/week_screen/week_screen.dart';

// ignore: must_be_immutable
class WeatherLayout extends StatelessWidget {
  WeatherLayout({Key? key}) : super(key: key);

  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return WeatherCubit.get(context).weatherModel != null ? Scaffold(
          body: PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              if (index == 0)
                return HomeScreen();
              else
                return WeekScreen();
            },
            itemCount: 2,
            physics: BouncingScrollPhysics(),
          ),
        ):Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
