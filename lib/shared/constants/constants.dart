import 'dart:io';

import 'package:flutter/foundation.dart';

//***//*Check What is the platform that we run on it

String getOS (){
  if(kIsWeb){
    return "";
  }
  return Platform.operatingSystem;
}