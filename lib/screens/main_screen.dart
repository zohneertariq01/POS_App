import 'package:flutter/material.dart';
import 'package:pos_app/route/routes_name.dart';
import 'package:pos_app/screens/bottom_sheet_screen.dart';
import 'package:pos_app/screens/category/add_category_screen.dart';
import 'package:pos_app/screens/home_screen.dart';
import 'package:pos_app/screens/intro_screen.dart';
import 'package:pos_app/screens/items/add_items_screen.dart';
import 'package:pos_app/screens/items/items_screen.dart';
import 'package:pos_app/screens/purchase/add_purchase_screen.dart';
import 'package:pos_app/screens/purchase/purchase_screen.dart';
import 'package:pos_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import '../controllers/menu_app_controller.dart';
import 'category/category_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuAppController = Provider.of<MenuAppController>(context);
    Widget screen;
    switch (menuAppController.selectedIndex) {
      case Routes.SPLASH_ROUTE:
        screen = SplashScreen();
        break;
      case Routes.INTRO_ROUTE:
        screen = IntroScreen();
        break;
      case Routes.BOTTOM_SHEET_ROUTE:
        screen = BottomSheetScreen();
        break;
      case Routes.CATEGORY_ROUTE:
        screen = CategoryScreen();
        break;
      case Routes.ADD_CATEGORY_ROUTE:
        screen = AddCategoryScreen();
      case Routes.ITEMS_REGISTRATION:
        screen = ItemsScreen();
      case Routes.ADD_ITEMS_REGISTRATION:
        screen = AddItemsScreen();
      case Routes.PURCHASE:
        screen = PurchaseScreen();
      case Routes.ADD_PURCHASE:
        screen = AddPurchaseScreen();
      default:
        screen = HomeScreen();
        break;
    }
    return Scaffold(
      extendBody: true,
      key: context.read<MenuAppController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // It takes 5/6 part of the screen
              flex: 8,
              child: screen,
            ),
          ],
        ),
      ),
    );
  }
}
