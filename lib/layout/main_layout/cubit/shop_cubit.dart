import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_states.dart';
import 'package:shop_appli/models/categories_model/categories_model.dart';
import 'package:shop_appli/models/change_favourites_model/change_favourites_model.dart';
import 'package:shop_appli/models/favourite_model/favourite_model.dart';
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
  CategoriesModel? categoriesModel;

  Map<int,bool> favourite = {};

  ChangeFavouriteModel?changeFavouriteModel;
  FavouriteModel? favouriteModel;

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
      homeModel!.data!.products.forEach((element) {
        favourite.addAll({
          element.id!:element.favourite,
        });
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  void getCategoriesData(){
    emit(ShopLoadingCategoriesDataState());
    DioHelper.getData(
      url: CATEGORIES,
      token: token!,
    ).then((value){
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesDataState());
    });
  }

  void changeFavourites({
  required int productId,
}){
    favourite[productId] = !favourite[productId]!;

    emit(ShopChangeFavouriteState());
    DioHelper.postData(
        url: FAVOURITES,
        data: {
          'product_id':productId,
        },
        token: token!)
        .then((value){
          changeFavouriteModel = ChangeFavouriteModel.fromJson(value.data);

          if(!changeFavouriteModel!.status!){
            favourite[productId] = !favourite[productId]!;
          }else{
            getFavouritesData();
          }
          emit(ShopChangeFavouriteSuccessState(
            changeFavouriteModel: changeFavouriteModel!,
          ));
    }).catchError((error){
      print(error.toString());
      favourite[productId] = !favourite[productId]!;
      emit(ShopChangeFavouriteErrorState());
    });

  }

  void getFavouritesData(){
    emit(ShopLoadingFavouriteState());
    DioHelper.getData(
      url: FAVOURITES,
      token: token!,
    ).then((value){
      favouriteModel = FavouriteModel.fromJson(value.data);
      emit(ShopSuccessFavouritesDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorFavouritesDataState());
    });
  }
}
