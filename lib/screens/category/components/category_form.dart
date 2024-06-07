import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pos_app/route/routes_name.dart';
import 'package:provider/provider.dart';
import '../../../components/customized_buttons.dart';
import '../../../controllers/menu_app_controller.dart';
import '../../../provider/count_value_provider.dart';
import '../../../utils/button_widget.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_helper.dart';

class CategoryForm extends StatefulWidget {
  final String code, name, desc;
  final String edit;

  CategoryForm({
    super.key,
    required this.edit,
    required this.code,
    required this.name,
    required this.desc,
  });

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  var categoryNameController = TextEditingController();

  var categoryDescriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<CountValueProvider>(context, listen: false)
    //     .fetchCountValue();
    Provider.of<CountValueProvider>(context, listen: false).fetchCountValue();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final countProvider =
        Provider.of<CountValueProvider>(context, listen: false);
    final provider =
    Provider.of<MenuAppController>(context, listen: false);
    return Container(
        width: size.width,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextHelper().mNormalText(
                    text: "Category Code: ", color: Colors.white, size: 14.0),
                Consumer<CountValueProvider>(
                  builder: (context, countValue, child) {
                    return TextHelper().mNormalText(
                        text: widget.edit == 'true'
                            ? widget.code
                            : countValue.countValue.toString(),
                        color: hoverColor,
                        size: 16.0);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextHelper().mNormalText(
                text: "Category Name", color: Colors.white, size: 14.0),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: size.width,
                child: CustomizeTextField(
                  controller: categoryNameController,
                  hintText: widget.edit == 'true'
                      ? categoryNameController.text = widget.name
                      : widget.name,
                  colors: Colors.white,
                )),
            const SizedBox(
              height: 20,
            ),
            TextHelper().mNormalText(
                text: "Category Description", color: Colors.white, size: 14.0),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: size.width,
                child: CustomizeTextField(
                  controller: categoryDescriptionController,
                  hintText: widget.edit == 'true'
                      ? categoryDescriptionController.text = widget.desc
                      : widget.desc,
                  colors: Colors.white,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              child: Row(
                children: [
                  widget.edit == 'true'
                      ? Container(
                          width: 100,
                          child: ButtonWidget(
                            text: "Update",
                            onClicked: () {
                              if (categoryNameController.text.isNotEmpty &&
                                  categoryDescriptionController
                                      .text.isNotEmpty) {
                                countProvider.updateCategory(
                                  code: widget.code,
                                  name: categoryNameController.text.toString(),
                                  description: categoryDescriptionController
                                      .text
                                      .toString(),
                                );
                                Get.snackbar("Category Updated...", "",
                                    backgroundColor: hoverColor,
                                    colorText: Colors.white);
                              } else {
                                Get.snackbar(
                                    "Alert!!!", "Please filled missing fields",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              }
                            },
                            icons: false,
                            width: 50.0,
                            height: 50.0,
                          ),
                        )
                      : Container(
                          width: 100,
                          child: ButtonWidget(
                            text: "Save",
                            onClicked: () {
                              if (categoryNameController.text.isNotEmpty &&
                                  categoryDescriptionController
                                      .text.isNotEmpty) {
                                provider.changeScreen(Routes.CATEGORY_ROUTE);
                                countProvider.fetchCountValue();
                                int newCountValue = countProvider.countValue;
                                countProvider.uploadCategory(
                                    count: newCountValue,
                                    name:
                                        categoryNameController.text.toString(),
                                    description: categoryDescriptionController
                                        .text
                                        .toString());
                                countProvider.updateCountValue(
                                    count: newCountValue + 1);
                                countProvider.fetchCountValue();
                                categoryNameController.text = "";
                                categoryDescriptionController.text = "";
                                Get.snackbar("New Category Added", "",
                                    backgroundColor: hoverColor,
                                    colorText: Colors.white);
                              } else {
                                Get.snackbar(
                                    "Alert!!!", "Please filled missing fields",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              }
                            },
                            icons: false,
                            width: 100.0,
                            height: 50.0,
                          ),
                        ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 100,
                    child: ButtonWidget(
                      text: "Cancel",
                      onClicked: () {
                        provider.changeScreen(Routes.CATEGORY_ROUTE);
                      },
                      icons: false,
                      width: 50.0,
                      height: 50.0,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
