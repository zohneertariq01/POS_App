import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/color.dart';
import '../../components/custom_button.dart';
import '../../controllers/menu_app_controller.dart';
import '../../route/routes_name.dart';
import '../../utils/constants.dart';
import '../../utils/text_helper.dart';
import 'components/category_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(2);
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<MenuAppController>(context, listen: false)
                        .changeScreen(Routes.BOTTOM_SHEET_ROUTE);
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
              const SizedBox(height: defaultDrawerHeadHeight + 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHelper().mNormalText(
                      text: "Items Category list",
                      color: Colors.white,
                      size: 14.0),
                  CustomButton(
                    width: 120.0,
                    height: 45.0,
                    isIcon: false,
                    label: 'Add New',
                    press: () {
                      Provider.of<MenuAppController>(context, listen: false)
                          .parameters
                          ?.clear();
                      Provider.of<MenuAppController>(context, listen: false)
                          .changeScreen(Routes.ADD_CATEGORY_ROUTE);
                    },
                  ),
                ],
              ),
              const SizedBox(height: defaultDrawerHeadHeight + 14.0),
              CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
