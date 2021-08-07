import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_appli/models/boarding_model/boarding_model.dart';

Widget buildBoardingItem({
  required BuildContext context,
  required BoardingModel boardingModel,
}) {
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage("${boardingModel.image}"),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '${boardingModel.title}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${boardingModel.body}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ));
}


enum ToastStates{
 SUCCESS , ERROR , WARNING
}

Color chooseToastColor({
  required ToastStates state,
}){
  switch(state){
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.yellow;
  }
}

void showToast({
 required String message,
  required ToastStates state,
})=>Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(
      state: state,
    ),
    textColor: Colors.white,
    fontSize: 16.0
);
