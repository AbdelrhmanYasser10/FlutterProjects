import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/modules/favourite_screen/favourite_screen.dart';
import 'package:shop_appli/modules/home_screen/home_screen.dart';
import 'package:shop_appli/modules/product_screen/product_screen.dart';
import 'package:shop_appli/modules/settings_screen/settings_screen.dart';

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
  void changeBottomScreens({
  required int index,
}){
    currentIndex = index;
    emit(ChangeBottomScreenState());
  }
}
