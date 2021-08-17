import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/model/current_weather_model/current_weather_model.dart';
import 'package:weather_app/model/forecast_model/forecast_model.dart';
import 'package:weather_app/model/location_model/location_model.dart';
import 'package:weather_app/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<WeatherCubit, WeatherStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    DateTime date = DateTime.parse(WeatherCubit.get(context)
        .weatherModel!
        .currentWeatherModel!
        .lastTimeUpdated!);

    CurrentWeatherModel currentWeatherModel =
    WeatherCubit.get(context).weatherModel!.currentWeatherModel!;
    ForecastModel forecastModel =
    WeatherCubit.get(context).weatherModel!.forecastModel!;
    LocationModel locationModel =
    WeatherCubit.get(context).weatherModel!.locationModel!;

    return Scaffold(
        backgroundColor: HexColor("#f9f9f9"),
        appBar: AppBar(
          backgroundColor: HexColor("#f9f9f9"),
          elevation: 0.0,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(
              Icons.search,
              color: Colors.black,
            )),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${locationModel.country}, ${locationModel.region}',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${currentWeatherModel.temperatureCelsius.round()}°',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            '${currentWeatherModel.currentWeatherCondition!.text!} \t ${forecastModel.data[0].forecastDayData!.maxTempC!.round()}° / ${forecastModel.data[0].forecastDayData!.minTempC.round()}°',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Image(
                            image: NetworkImage(
                                "https:${currentWeatherModel.currentWeatherCondition!.image!}"),
                          ),
                          Text(
                            'Feels like ${currentWeatherModel.feelsLikeC.round()}°',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    '${forecastModel.data[0].forecastDayAstro!.sunRise!}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.moon,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    '${forecastModel.data[0].forecastDayAstro!.moonRise!}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.wind,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    '${forecastModel.data[0].forecastDayData!.maxWindKph!.round()} km/h',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.water,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    '${forecastModel.data[0].forecastDayData!.avgHumidity!.round()}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidSun,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    'UV:${forecastModel.data[0].forecastDayData!.uv!.round()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.cloudSun,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text(
                                    '${forecastModel.data[0].forecastDayAstro!.sunSet}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(2.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 2.0),
                        BoxShadow(color: Colors.black12, blurRadius: 2.0),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 5.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              currentWeatherModel.isDay==1?'Its currently ${currentWeatherModel.currentWeatherCondition!.text!} , ${currentWeatherModel.temperatureCelsius.round()}° and the sun sets in ${forecastModel.data[0].forecastDayAstro!.sunSet}' : 'Its currently ${currentWeatherModel.currentWeatherCondition!.text!} , ${currentWeatherModel.temperatureCelsius.round()}° and the sun rise in ${forecastModel.data[0].forecastDayAstro!.sunRise}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    '${DateFormat.yMMMMEEEEd().format(date)}',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>buildDayConditions(
                          context: context,
                          index: index,
                          forecastModel: forecastModel,
                        ),
                        separatorBuilder: (context,index)=>SizedBox(
                          width: 10.0,
                        ),
                        itemCount: forecastModel.data[0].hours.length
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  },
);
  }
}
