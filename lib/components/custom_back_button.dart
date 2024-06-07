import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/menu_app_controller.dart';
import '../route/routes_name.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          provider.changeScreen(Routes.BOTTOM_SHEET_ROUTE);
        },
        child: Container(
          height: 42.0,
          width: 42.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 22.0,
          ),
        ),
      ),
    );
  }
}
