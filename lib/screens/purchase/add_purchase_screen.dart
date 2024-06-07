import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/menu_app_controller.dart';
import '../../route/routes_name.dart';
import '../../utils/constants.dart';
import '../../utils/text_helper.dart';
import 'components/purchase_form.dart';

class AddPurchaseScreen extends StatelessWidget {
  const AddPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(7);
        return false;
      },
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          provider.changeScreen(Routes.PURCHASE);
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
                    SizedBox(width: defaultDrawerHeadHeight + 78.0),
                    TextHelper().mNormalText(
                        text: 'Purchase', color: Colors.white, size: 18.0),
                  ],
                ),
                SizedBox(height: defaultDrawerHeadHeight + 10),
                TextHelper().mNormalText(
                    text: "Add New Purchase",
                    color: Colors.white70,
                    size: 14.0),
                SizedBox(height: defaultDrawerHeadHeight + 20.0),
                PurchaseForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
