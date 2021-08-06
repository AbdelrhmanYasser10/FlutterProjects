import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/presentation_layer/shared/colors/colors.dart';
import'package:flutter/material.dart';

void main(){
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
