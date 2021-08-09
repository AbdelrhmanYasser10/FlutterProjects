import 'package:shop_appli/modules/log_in_screen/login_screen.dart';
import 'package:shop_appli/shared/network/local/cache_helper.dart';

import 'package:flutter/material.dart';
String? token;


void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
     Navigator.pushAndRemoveUntil(context,
         MaterialPageRoute(builder: (context)=>LogInScreen()),
             (route) => false);
    }
  });

}