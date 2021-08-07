import 'package:shop_appli/models/login_model/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginStates {}
