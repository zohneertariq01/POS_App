import 'package:flutter/material.dart';
import 'package:pos_app/screens/privacy_policy_screen.dart';
import 'package:pos_app/utils/constants.dart';
import 'package:provider/provider.dart';
import '../controllers/menu_app_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<MenuAppController>(context, listen: false).changeScreen(2);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text('Settings'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen()));
            },
            child: Container(
              height: 54.0,
              decoration: BoxDecoration(
                color: hoverColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.privacy_tip, size: 26.0, color: bgColor),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(color: bgColor),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: bgColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
