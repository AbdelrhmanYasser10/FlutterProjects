import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/models/login_model/login_model.dart';
import 'package:shop_appli/modules/log_in_screen/cubit/login_state.dart';
import 'package:shop_appli/shared/network/end_points.dart';
import 'package:shop_appli/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? model;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      model = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(
        loginModel: model!,
      ));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
