import 'package:flutter/material.dart';
import 'package:pos_app/controllers/menu_app_controller.dart';
import 'package:pos_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../components/color.dart';
import '../route/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'POS System',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 12.0),
              child: Image(
                height: 280,
                width: width * 0.9,
                image: const AssetImage("assets/images/home.png"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      provider.changeScreen(Routes.CATEGORY_ROUTE);
                    },
                    child: Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: hoverColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Category',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.08),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      provider.changeScreen(Routes.ITEMS_REGISTRATION);
                    },
                    child: Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: hoverColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Items',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            InkWell(
              onTap: () {
                provider.changeScreen(Routes.PURCHASE);
              },
              child: Container(
                height: 42.0,
                decoration: BoxDecoration(
                  color: hoverColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Purchase',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
