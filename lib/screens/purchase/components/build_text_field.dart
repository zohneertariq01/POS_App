import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pos_app/screens/purchase/components/purchase_form.dart';
import 'package:provider/provider.dart';
import '../../../provider/items_data_fetch_provider.dart';
import '../../../utils/constants.dart';
import '../provider/formbuilder_firebase_provider.dart';

class BuildTextField extends StatefulWidget {
  final int index;
  BuildTextField({
    Key? key,
    required this.index,
  });

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  late FormControllers _formControllers;

  MultiController multiController = MultiController();

  @override
  void initState() {
    super.initState();
    _formControllers = Provider.of<FormBuilderProvider>(context, listen: false)
        .controllers[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemsDataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text('Item Code: '),
                ),
                Consumer<ItemsDataProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.selectedItemNameId.toString(),
                      style: TextStyle(color: hoverColor),
                    );
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text('Stock: '),
                ),
                Consumer<ItemsDataProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.selectedItemStock.toString(),
                      style: TextStyle(color: hoverColor),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items Name',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      height: 55.0,
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: hoverColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Consumer<ItemsDataProvider>(
                        builder: (context, values, child) {
                          if (values.itemName.isEmpty) {
                            values.fetchAllItemElements();
                            return Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "No Items Found",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          } else {
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'Select Item Name',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: provider.itemName
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
                                      value: provider.selectedItemName,
                                      onChanged: (value) {
                                        setState(() {
                                          provider.selectedItemName = value;
                                          int itemIndex =
                                              provider.itemName.indexOf(value!);
                                          provider.selectedItemNameId =
                                              provider.itemsID[itemIndex];
                                          provider.selectedItemSalePrice =
                                              provider.itemSalePrice[itemIndex];
                                          provider.selectedItemPurchasePrice =
                                              provider
                                                  .itemPurchasePrice[itemIndex];
                                          provider.selectedItemStock =
                                              provider.itemStock[itemIndex];
                                          provider.selectedItemStock =
                                              provider.itemStock[itemIndex];
                                          provider.selectedUom =
                                              provider.uom[itemIndex];
                                          _formControllers
                                              .itemNameController.text = value!;
                                          _formControllers
                                              .itemNameController.text = value;
                                          _formControllers
                                                  .itemCodeController.text =
                                              provider.itemsID[itemIndex];
                                          _formControllers.uomController.text =
                                              provider.uom[itemIndex];
                                          _formControllers
                                                  .stockController.text =
                                              provider.itemStock[itemIndex];
                                          _formControllers
                                                  .saleRateController.text =
                                              provider.itemSalePrice[itemIndex];
                                          _formControllers
                                                  .priceRateController.text =
                                              provider
                                                  .itemPurchasePrice[itemIndex];
                                          updateAmount();
                                          updateTotal();
                                        });
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        height: 57.0,
                                        width: 400.0,
                                      ),
                                      dropdownStyleData:
                                          const DropdownStyleData(
                                        maxHeight: 200.0,
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40.0,
                                      ),
                                      dropdownSearchData: DropdownSearchData(
                                        searchController:
                                            _formControllers.itemController,
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
                                            controller:
                                                _formControllers.itemController,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 8.0,
                                              ),
                                              hintText:
                                                  'Search for Item Name...',
                                              hintStyle: const TextStyle(
                                                  fontSize: 12.0),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        searchMatchFn: (item, searchValue) {
                                          return item.value
                                              .toString()
                                              .contains(searchValue);
                                        },
                                      ),
                                      onMenuStateChange: (isOpen) {
                                        if (!isOpen) {
                                          _formControllers.itemController
                                              .clear();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      cursorColor: hoverColor,
                      controller: _formControllers.quantityController,
                      decoration: InputDecoration(
                        hintText:
                            _formControllers.quantityController.text.isEmpty
                                ? _formControllers.quantityController.text = '1'
                                : _formControllers.quantityController.text,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                      ),
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        updateQuantityForIndex(widget.index);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                      'P.Price',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      cursorColor: hoverColor,
                      controller: _formControllers.priceRateController,
                      decoration: InputDecoration(
                        hintText: provider.selectedItemPurchasePrice != null
                            ? _formControllers.priceRateController.text =
                                provider.selectedItemPurchasePrice!
                            : "0",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                      'S.Rate',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      cursorColor: hoverColor,
                      controller: _formControllers.saleRateController,
                      decoration: InputDecoration(
                        hintText: provider.selectedItemSalePrice != null
                            ? _formControllers.saleRateController.text =
                                provider.selectedItemSalePrice!
                            : "0",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      cursorColor: hoverColor,
                      controller: _formControllers.discountController,
                      decoration: InputDecoration(
                        hintText:
                            _formControllers.totalAmountController.text.isEmpty
                                ? _formControllers.discountController.text = '0'
                                : _formControllers.discountController.text,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                      ),
                      onChanged: (value) {
                        updateTotal();
                      },
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      cursorColor: hoverColor,
                      controller: _formControllers.totalController,
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 16.0, color: hoverColor),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      cursorColor: hoverColor,
                      controller: _formControllers.totalAmountController,
                      decoration: InputDecoration(
                        hintText: 'T.Amount',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: hoverColor),
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void updateTotal() {
    updateQuantity();
    updateAmount();
    updateTotalAmount();
    updatePlusStock();
  }

  void updateQuantity() {
    double quantity =
        double.tryParse(_formControllers.quantityController.text) ?? 0;
    _formControllers.quantityController.text = quantity.toString();
  }

  void updateAmount() {
    final provider = Provider.of<ItemsDataProvider>(context, listen: false);
    double priceRate =
        double.tryParse(provider.selectedItemPurchasePrice ?? '0') ?? 0;
    double quantity =
        double.tryParse(_formControllers.quantityController.text) ?? 0;
    double amount = priceRate * quantity;
    _formControllers.totalController.text = amount.toString();
  }

  void updateTotalAmount() {
    double discount =
        double.tryParse(_formControllers.discountController.text) ?? 0;
    double amount = double.tryParse(_formControllers.totalController.text) ?? 0;
    double totalAmount = amount - (amount * (discount / 100));
    _formControllers.totalAmountController.text = totalAmount.toString();
  }

  void updatePlusStock() {
    final provider = Provider.of<ItemsDataProvider>(context, listen: false);
    double stock = double.tryParse(provider.selectedItemStock.toString()) ?? 0;
    double quantity =
        double.tryParse(_formControllers.quantityController.text) ?? 0;
    double stockAddition = stock + quantity;
    _formControllers.plusStockController.text = stockAddition.toString();
  }

  void updatesQuantity(String value) {
    setState(() {
      final quantity = double.tryParse(value) ?? 0.0;
      final formattedQuantity =
          quantity % 1 == 0 ? quantity.toInt().toString() : quantity.toString();
      _formControllers.quantityController.text = formattedQuantity;
    });
  }

  void updateQuantityForIndex(index) {
    final quantity =
        double.tryParse(_formControllers.quantityController.text) ?? 0.0;
    final formattedQuantity =
        quantity % 1 == 0 ? quantity.toInt().toString() : quantity.toString();
    if (index == widget.index) {
      _formControllers.quantityController.text = formattedQuantity.toString();
      updateAmount();
      updateTotalAmount();
      updatePlusStock();
    }
  }
}

class FormControllers {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController uomController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceRateController = TextEditingController();
  TextEditingController saleRateController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController plusStockController = TextEditingController();
}
