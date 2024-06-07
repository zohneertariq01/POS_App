import 'package:flutter/material.dart';
import 'package:pos_app/screens/purchase/provider/purchase_items_list.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../controllers/menu_app_controller.dart';
import '../../route/routes_name.dart';
import '../../utils/constants.dart';
import '../../utils/text_helper.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(2);
        return false;
      },
      child: SingleChildScrollView(
        primary: false,
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
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
                    text: "Purchase List",
                    color: Colors.white,
                    size: 14.0,
                  ),
                  CustomButton(
                    press: () {
                      provider.parameters?.clear();
                      provider.changeScreen(Routes.ADD_PURCHASE);
                    },
                    width: 150.0,
                    height: 50.0,
                    label: "Add New",
                    isIcon: false,
                  ),
                ],
              ),
              SizedBox(height: defaultDrawerHeadHeight + 20.0),
              PurchaseList(),
            ],
          ),
        ),
      ),
    );
  }
}
