import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_application/controllers/quote_controller/quote_controller.dart';
import 'package:note_application/screens/home_screen/home_screen.dart';
import 'package:note_application/shared/database/database_helper.dart';
import 'package:note_application/shared/services/theme_services/theme_services.dart';
import 'package:note_application/shared/style/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initDatabase();
  await QuoteController().getAllQuotes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note Application [TO DO]',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
