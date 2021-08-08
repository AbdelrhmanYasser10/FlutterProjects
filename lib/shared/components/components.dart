import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
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


// ignore: non_constant_identifier_names
Widget? CategoryIcon({
  String? name,
}){

  switch(name){
    case 'Best Offers':
      return Icon(
        Icons.local_offer,
        color: HexColor('#8b847a'),
      );
    case 'Electronics':
      return Icon(
        Icons.wb_incandescent,
        color: HexColor('#8b847a'),
      );
    case 'Prevent Corona':
      return Icon(
        Icons.health_and_safety,
        color: HexColor('#8b847a'),
      );
    case 'Super Market':
      return Icon(
        Icons.shopping_bag,
        color: HexColor('#8b847a'),
      );
    case 'Toys':
      return Icon(
        Icons.toys,
        color: HexColor('#8b847a'),
      );

    case 'Sports':
      return Icon(
        Icons.sports,
        color: HexColor('#8b847a'),
      );

    case 'Fresh food':
      return Icon(
        Icons.fastfood_rounded,
        color: HexColor('#8b847a'),
      );

    case 'Mobiles':
      return Icon(
        Icons.mobile_screen_share,
        color: HexColor('#8b847a'),
      );
    case 'Moms & Babies':
      return Icon(
        Icons.baby_changing_station,
        color: HexColor('#8b847a'),
      );

    case 'Computers':
      return Icon(
        Icons.computer,
        color: HexColor('#8b847a'),
      );

    case 'Accessories':
      return Icon(
        Icons.watch,
        color: HexColor('#8b847a'),
      );
    case 'Kitchen':
      return Icon(
        Icons.kitchen,
        color: HexColor('#8b847a'),
      );
    case 'Appliances':
      return FaIcon(
        FontAwesomeIcons.apple,
        color: HexColor('#8b847a'),
      );
  }

}
