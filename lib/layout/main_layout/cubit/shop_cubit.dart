import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/models/home_model/home_model.dart';
import 'package:shop_appli/modules/favourite_screen/favourite_screen.dart';
import 'package:shop_appli/modules/home_screen/home_screen.dart';
import 'package:shop_appli/modules/product_screen/product_screen.dart';
import 'package:shop_appli/modules/settings_screen/settings_screen.dart';
import 'package:shop_appli/shared/constants/constants.dart';
import 'package:shop_appli/shared/network/end_points.dart';
import 'package:shop_appli/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<String>titles=[
    'Home',
    'Product',
    'Favourites',
    'Settings'
  ];

  List<Widget> screens =[
    HomeScreen(),
    ProductScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];

  HomeModel? homeModel;

  void changeBottomScreens({
  required int index,
}){
    currentIndex = index;
    emit(ChangeBottomScreenState());
  }

  void getHomeData(){
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
        url:HOME,
        token: token!,
    ).then((value){
      homeModel = HomeModel.fromJson(value.data);
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }
}
