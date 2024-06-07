import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pos_app/controllers/menu_app_controller.dart';
import 'package:pos_app/provider/bottom_sheet_provider.dart';
import 'package:pos_app/provider/count_value_provider.dart';
import 'package:pos_app/provider/items_data_fetch_provider.dart';
import 'package:pos_app/provider/splash_provider.dart';
import 'package:pos_app/screens/items/provider/items_firebase_provider.dart';
import 'package:pos_app/screens/main_screen.dart';
import 'package:pos_app/screens/purchase/provider/formbuilder_firebase_provider.dart';
import 'package:pos_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SplashProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CountValueProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomSheetProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ItemsDataProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => RegisterFirebaseProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FormBuilderProvider(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
