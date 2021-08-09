import 'package:shop_appli/models/change_favourites_model/change_favourites_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ChangeBottomScreenState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{}


class ShopLoadingCategoriesDataState extends ShopStates{}

class ShopSuccessCategoriesDataState extends ShopStates{}

class ShopErrorCategoriesDataState extends ShopStates{

}

class ShopSuccessFavouritesDataState extends ShopStates{}

class ShopErrorFavouritesDataState extends ShopStates{

}

class ShopSuccessUserDataState extends ShopStates{}

class ShopErrorUserDataState extends ShopStates{

}


class ShopChangeFavouriteState extends ShopStates{

}

class ShopLoadingFavouriteState extends ShopStates{

}

class ShopChangeFavouriteSuccessState extends ShopStates{
  late ChangeFavouriteModel changeFavouriteModel;
  ShopChangeFavouriteSuccessState({
    required this.changeFavouriteModel,
  });
}

class ShopChangeFavouriteErrorState extends ShopStates{}