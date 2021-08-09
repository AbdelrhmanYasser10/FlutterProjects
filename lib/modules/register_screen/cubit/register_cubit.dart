import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/models/login_model/login_model.dart';
import 'package:shop_appli/modules/register_screen/cubit/register_states.dart';
import 'package:shop_appli/shared/network/end_points.dart';
import 'package:shop_appli/shared/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(ShopRegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data:
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value)
    {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }


}