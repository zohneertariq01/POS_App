import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/components/custom_back_button.dart';
import 'package:pos_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../../components/custom_button.dart';
import '../../controllers/menu_app_controller.dart';
import '../../route/routes_name.dart';
import '../../utils/constants.dart';
import '../../utils/text_helper.dart';
import 'components/items_list.dart';

class ItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(2);
        return false;
      },
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
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
              ),
              SizedBox(height: defaultDrawerHeadHeight + 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHelper().mNormalText(
                      text: "Items List", color: Colors.white, size: 14.0),
                  CustomButton(
                    width: 150.0,
                    height: 50.0,
                    isIcon: false,
                    label: 'Add New',
                    press: () {
                      provider.parameters?.clear();
                      provider.changeScreen(Routes.ADD_ITEMS_REGISTRATION);
                    },
                  ),
                ],
              ),
              const SizedBox(height: defaultDrawerHeadHeight + 20.0),
              const ItemsList()
            ],
          ),
        ),
      ),
    );
  }
}
