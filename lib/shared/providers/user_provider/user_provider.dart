import 'package:flutter/material.dart';
import 'package:instagram_clone/shared/network/resources/auth_method/auth_method.dart';
import '../../../model/user_model/user_model.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  final AuthMethod _authMethod = AuthMethod();
  User get getUser => _user!;

  Future<void> refreshUser() async{
     User user = await _authMethod.getUserDetails();
     _user = user;
     notifyListeners();
  }
}