import 'package:flutter/material.dart';

Widget buildDayConditions({
  required context,
  required index,
  required forecastModel,
}){
  return Column(
    children: [
      Text(
        '${DateTime.parse(forecastModel.data[0].hours[index].time!).hour}:${DateTime.parse(forecastModel.data[0].hours[index].time!).minute}0',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      Image(
        image: NetworkImage("https:${forecastModel.data[0].hours[index].forecastDayHourCondition!.image!}"),
      ),
      Text(
          '${forecastModel.data[0].hours[index].forecastDayHourCondition!.text}'
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        '${forecastModel.data[0].hours[index].tempC.round()}°',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
    ],
  );
}