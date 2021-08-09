import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appli/layout/main_layout/cubit/shop_cubit.dart';
import 'package:shop_appli/shared/bloc/cubit/app_cubit/app_cubit.dart';
import 'package:shop_appli/shared/bloc/cubit/app_cubit/app_states/app_states.dart';
import 'package:shop_appli/shared/bloc_observer.dart';
import 'package:shop_appli/shared/constants/constants.dart';
import 'package:shop_appli/shared/network/local/cache_helper.dart';
import 'package:shop_appli/shared/themes/themes.dart';
import 'modules/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') == null?false:CacheHelper.getData(key: 'isDark');
  token = CacheHelper.getData(key: 'token');

  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {

  late final bool isDark;

  MyApp({
    required this.isDark,
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => AppCubit(),),
        BlocProvider(create: (context)=>ShopCubit()..getHomeData()..getCategoriesData()..getFavouritesData()..getUserData(),),
      ],
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: SplashScreen(),
            );
          },
        ),
    );
  }
}