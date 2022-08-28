import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToBlue = MaterialColor(
    0xff4e5ae8, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50:  Color(0xff4e5ae8 ),//10%
      100:  Color(0xff2838e8),//20%
      200:  Color(0xff1927e5),//30%
      300:  Color(0xff1024e1),//40%
      400:  Color(0xff060fa9),//50%
      500:  Color(0xff040c8a),//60%
      600:  Color(0xff020549),//70%
      700:  Color(0xff020644),//80%
      800:  Color(0xff01053a),//90%
      900:  Color(0xff000318),//100%
    },
  );
}