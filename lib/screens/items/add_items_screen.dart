import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/components/custom_back_button.dart';
import 'package:provider/provider.dart';

import '../../controllers/menu_app_controller.dart';
import '../../route/routes_name.dart';
import '../../utils/constants.dart';
import '../../utils/text_helper.dart';
import 'components/items_form.dart';

class AddItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(5);
        return false;
      },
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        provider.changeScreen(Routes.ITEMS_REGISTRATION);
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
                  const SizedBox(width: defaultDrawerHeadHeight + 85.0),
                  TextHelper().mNormalText(
                      text: "Items", color: Colors.white, size: 18.0),
                ],
              ),
              const SizedBox(height: defaultDrawerHeadHeight + 10.0),
              TextHelper().mNormalText(
                  text: "Add new Items", color: Colors.white70, size: 14.0),
              const SizedBox(height: defaultDrawerHeadHeight + 15.0),
              ItemsRegistrationForm(
                edit: provider.parameters?['edit'] ?? 'false',
                code: provider.parameters?[Constant.KEY_ITEM_CODE] ?? "no code",
                name: provider.parameters?[Constant.KEY_ITEM_NAME] ??
                    'Enter Item Name',
                category: provider.parameters?[Constant.KEY_ITEM_CATEGORY] ??
                    'Enter category',
                uom: provider.parameters?[Constant.KEY_ITEM_UOM] ?? 'Enter uom',
                stock: provider.parameters?[Constant.KEY_ITEM_STOCK] ??
                    'Enter stock',
                quantity: provider.parameters?[Constant.KEY_ITEM_QUANTITY] ??
                    'Enter quantity',
                purchasePrice:
                    provider.parameters?[Constant.KEY_ITEM_PURCHASE_PRICE] ??
                        'Enter Purchase Price',
                salePrice: provider.parameters?[Constant.KEY_ITEM_SALE_PRICE] ??
                    'Enter Sale Price',
                joinDate:
                    provider.parameters?[Constant.KEY_VENDORMAN_JOIN_DATE] ??
                        'select date',
                status: provider.parameters?[Constant.KEY_STATUS] ??
                    'choose status',
              )
            ],
          ),
        ),
      ),
    );
  }
}
