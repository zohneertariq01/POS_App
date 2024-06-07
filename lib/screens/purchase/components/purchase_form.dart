import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pos_app/controllers/menu_app_controller.dart';
import 'package:provider/provider.dart';
import '../../../components/customized_buttons.dart';
import '../../../controllers/cash_dropdown.dart';
import '../../../provider/count_value_provider.dart';
import '../../../provider/items_data_fetch_provider.dart';
import '../../../route/routes_name.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_helper.dart';
import '../../../utils/text_widget.dart';
import '../pdf/purchase_generate_pdf.dart';
import '../provider/formbuilder_firebase_provider.dart';
import 'build_text_field.dart';

class PurchaseForm extends StatelessWidget {
  int index;
  PurchaseForm({super.key, this.index = 0});

  TextEditingController _remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormBuilderProvider>(context, listen: false);
    final provider1 = Provider.of<CountValueProvider>(context, listen: false);
    Provider.of<CountValueProvider>(context, listen: false).fetchCountValue();
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHelper().mNormalText(
                          text: "Invoice Number:",
                          color: Colors.white,
                          size: 14.0),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: size.width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Consumer<CountValueProvider>(
                            builder: (context, value, child) {
                              return TextHelper().mNormalText(
                                  text: value.countValue.toString(),
                                  color: hoverColor,
                                  size: 16.0);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80.0,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHelper().mNormalText(
                          text: "Joining\n Date",
                          color: Colors.white,
                          size: 14.0),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Consumer<FormBuilderProvider>(
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              value.datePicker(context);
                            },
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 20.0,
                                      bottom: 20.0),
                                  child: TextWidget(
                                    text: value.joiningDate,
                                    color: hoverColor,
                                    size: 14.0,
                                    isBold: false,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHelper().mNormalText(
                          text: "Remarks", color: Colors.white, size: 14.0),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: size.width,
                        child: CustomizeTextField(
                          controller: _remarksController,
                          hintText: '',
                          colors: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80.0,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHelper().mNormalText(
                          text: "Payment Term:",
                          color: Colors.white,
                          size: 14.0),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: size.width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        child: CashDropDown(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Padding(
            padding: EdgeInsets.only(right: 18.0, left: 5.0),
            child: Divider(
              color: hoverColor,
              thickness: 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 18.0, left: 5.0, bottom: 8.0),
            child: Divider(
              color: hoverColor,
              thickness: 2.5,
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Consumer<FormBuilderProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: value.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Text('Serial no: '),
                              ),
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(color: hoverColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      value.items[index],
                      SizedBox(height: 10.0),
                      if (index == value.items.length - 1)
                        Center(
                          child: Container(
                            height: 32.0,
                            width: 32.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                              color: hoverColor,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 16.0,
                              ),
                              onPressed: () {
                                Provider.of<FormBuilderProvider>(context,
                                        listen: false)
                                    .deleteItem(index, context);
                                print('indexToDelete: $index');
                              },
                            ),
                          ),
                        ),
                      SizedBox(height: 12.0),
                      Divider(),
                      SizedBox(height: 18.0),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                height: 36.0,
                width: 36.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hoverColor,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  onPressed: () {
                    Provider.of<FormBuilderProvider>(context, listen: false)
                        .addItem(context);
                  },
                ),
              ),
              SizedBox(width: 8.0),
              TextButton(
                onPressed: () {
                  // preview:
                  List<Map<String, String>> rowsData = [];
                  for (int i = 0; i < provider.items.length; i++) {
                    FormControllers controllers = provider.controllers[i];

                    String selectedItemName =
                        controllers.itemNameController.text;
                    String selectedItemCode =
                        controllers.itemCodeController.text;
                    String selectedUom = controllers.uomController.text;
                    String selectedStock = controllers.stockController.text;
                    String totalAmount = controllers.totalAmountController.text;
                    String quantity = controllers.quantityController.text;
                    String priceRate = controllers.priceRateController.text;
                    String saleRate = controllers.saleRateController.text;
                    String discount = controllers.discountController.text;
                    String total = controllers.totalController.text;
                    String plusStock = controllers.stockController.text +
                        "+" +
                        controllers.quantityController.text;

                    rowsData.add({
                      'SerialNumber': (i + 1).toString(),
                      'ItemName': selectedItemName,
                      'ItemCode': selectedItemCode,
                      'ItemPriceRate': priceRate,
                      'ItemSalePrice': saleRate,
                      'Amount': total,
                      'TotalAmount': totalAmount,
                      'Discount': discount,
                      'Quantity': quantity,
                      'Uom': selectedUom,
                      'Stock': selectedStock,
                      'PlusStock': plusStock,
                    });
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchasePdf(
                        cash: MultiController.cash1.toString(),
                        joinDate: provider.joiningDate,
                        remarks: _remarksController.text,
                        rowsData: rowsData,
                        invoiceNumber: provider1.countValue.toString(),
                      ),
                    ),
                  );
                  // save:
                  provider.saveDataToFireStore(
                    context,
                    purchaseCode: provider1.countValue.toString(),
                    paymentVia: AllController.cash,
                    remarks: _remarksController.text.toString(),
                    date: provider.joiningDate,
                    time: DateTime.now(),
                  );
                  provider1.fetchCountValue();
                  int newCountValue = provider1.countValue;
                  provider1.updateCountValue(count: newCountValue + 1);
                },
                child: Container(
                  height: 36.0,
                  width: 115.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: hoverColor,
                  ),
                  child: Center(
                    child: Text(
                      'Save & Preview',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  List<Map<String, String>> rowsData = [];
                  for (int i = 0; i < provider.items.length; i++) {
                    FormControllers controllers = provider.controllers[i];

                    String selectedItemName =
                        controllers.itemNameController.text;
                    String selectedItemCode =
                        controllers.itemCodeController.text;
                    String selectedUom = controllers.uomController.text;
                    String selectedStock = controllers.stockController.text;
                    String totalAmount = controllers.totalAmountController.text;
                    String quantity = controllers.quantityController.text;
                    String priceRate = controllers.priceRateController.text;
                    String saleRate = controllers.saleRateController.text;
                    String discount = controllers.discountController.text;
                    String total = controllers.totalController.text;
                    String plusStock = controllers.stockController.text +
                        "+" +
                        controllers.quantityController.text;

                    rowsData.add({
                      'SerialNumber': (i + 1).toString(),
                      'ItemName': selectedItemName,
                      'ItemCode': selectedItemCode,
                      'ItemPriceRate': priceRate,
                      'ItemSalePrice': saleRate,
                      'Amount': total,
                      'TotalAmount': totalAmount,
                      'Discount': discount,
                      'Quantity': quantity,
                      'Uom': selectedUom,
                      'Stock': selectedStock,
                      'PlusStock': plusStock,
                    });
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchasePdf(
                        cash: MultiController.cash1.toString(),
                        joinDate: provider.joiningDate,
                        remarks: _remarksController.text,
                        rowsData: rowsData,
                        invoiceNumber: provider1.countValue.toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 36.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: hoverColor,
                  ),
                  child: Center(
                    child: Text(
                      'Preview',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MultiController {
  static double totalPurchase = 0.0;
  static dynamic cash1 = TextEditingController();
  static dynamic vendor1 = TextEditingController();
}
