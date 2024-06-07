import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/items_data_fetch_provider.dart';
import '../screens/purchase/components/purchase_form.dart';
import '../utils/constants.dart';

class CashDropDown extends StatefulWidget {
  const CashDropDown({Key? key}) : super(key: key);

  @override
  _CashDropDownState createState() => _CashDropDownState();
}

class _CashDropDownState extends State<CashDropDown> {
  late TextEditingController _cashController;

  @override
  void initState() {
    super.initState();
    _cashController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ItemsDataProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Payment',
                style: TextStyle(
                  fontSize: 14.0,
                  color: hoverColor,
                ),
              ),
              items: dataProvider.cashMethods
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ))
                  .toList(),
              value: dataProvider.selectCashMethod,
              onChanged: (value) {
                setState(() {
                  dataProvider.selectCashMethod = value;
                  AllController.cash = value;
                  SaleAllController.saleCash = value;
                  MultiController.cash1 = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                height: 57.0,
                width: 400.0,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 200.0,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40.0,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: _cashController,
                searchInnerWidgetHeight: 50.0,
                searchInnerWidget: Container(
                  height: 57.0,
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 4.0,
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: _cashController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                      hintText: 'Search for Payment',
                      hintStyle: const TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().contains(searchValue);
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  _cashController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cashController.dispose();
    super.dispose();
  }
}

class AllController {
  static dynamic cash = TextEditingController();
  static dynamic vendor = TextEditingController();
}

class SaleAllController {
  static dynamic saleCash = TextEditingController();
  static dynamic saleVendor = TextEditingController();
  static dynamic saleCustomer = TextEditingController();
  static dynamic saleSupplyMan = TextEditingController();
  static dynamic saleSalesMan = TextEditingController();
}
