import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pos_app/controllers/menu_app_controller.dart';
import 'package:provider/provider.dart';
import '../route/routes_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    Timer(Duration(seconds: 3), () {
      provider.changeScreen(Routes.INTRO_ROUTE);
    });
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // color: ColorSet.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 250,
              width: width * 0.5,
              image: AssetImage("assets/images/logo.png"),
            ),
            Center(
              child: Text(
                "POS System",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
