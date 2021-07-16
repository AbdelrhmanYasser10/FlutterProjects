import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/local/shared_refrence/chace.dart';
import 'package:news_app/shared/cubit/states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isLight = true;

  void changeAppMode({bool fromShared}){

    if(fromShared != null) {
      isLight = fromShared;
      emit(ChangeAppThemeState());
    }
    else {
      isLight = !isLight;
      CacheHelper.putData(
        key: 'isLight',
        value: isLight,
      ).then((value) {
        emit(ChangeAppThemeState());
      });
    }
  }
}
