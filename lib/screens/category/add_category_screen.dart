import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/menu_app_controller.dart';
import '../../route/routes_name.dart';
import '../../utils/constants.dart';
import '../../utils/text_helper.dart';
import 'components/category_form.dart';

class AddCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(3);
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    provider.changeScreen(Routes.CATEGORY_ROUTE);
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
              TextHelper().mNormalText(
                  text: "Items Category", color: Colors.white, size: 18.0),
              const SizedBox(height: defaultDrawerHeadHeight - 10),
              TextHelper().mNormalText(
                  text: "Create new item Category",
                  color: Colors.white,
                  size: 14.0),
              const SizedBox(height: defaultDrawerHeadHeight + 20),
              CategoryForm(
                edit: provider.parameters?['edit'] ?? 'false',
                code:
                    provider.parameters?[Constant.KEY_CATEGORY_ID] ?? "no code",
                name: provider.parameters?[Constant.KEY_CATEGORY_NAME] ??
                    'Enter Category Name',
                desc: provider.parameters?[Constant.KEY_CATEGORY_DESC] ??
                    'Enter Description',
              )
            ],
          ),
        ),
      ),
    );
  }
}
