import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/constants.dart';
import '../components/build_text_field.dart';
import '../components/purchase_form.dart';

class FormBuilderProvider with ChangeNotifier {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static CollectionReference ref =
      FirebaseFirestore.instance.collection('purchase');

  String joiningDate = 'Date';

  List<BuildTextField> _items = [];
  List<BuildTextField> get items => _items;

  List<FormControllers> _controllers = [];
  List<FormControllers> get controllers => _controllers;

  void addItem(BuildContext context) {
    _items.add(BuildTextField(index: _items.length));
    _controllers.add(FormControllers());
    notifyListeners();
  }

  void deleteItem(int index, BuildContext context) {
    _items.removeAt(index);
    notifyListeners();
  }

  Future<void> saveDataToFireStore(
    BuildContext context, {
    required purchaseCode,
    purchaseDate,
    time,
    vendorID,
    remarks,
    paymentVia,
    date,
  }) async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      String month = DateFormat('MMMM').format(DateTime.now());
      await fireStore.collection('purchase').doc(purchaseCode).set({
        'purchaseCode': purchaseCode,
        'date': date,
        'p.date&time': time,
        Constant.KEY_PURCHASE_TIMESTAMP: id,
        'remarks': remarks,
        'paymentVia': paymentVia,
        'invoiceType': 'purchase',
        'month': month,
      }).whenComplete(() {
        print("Running");
        saveItems(context, purchaseCode);
      });
      print('Data saved to Firestore successfully');
    } catch (error) {
      print('Error saving data to Firestore: $error');
    }
  }

  Future<void> saveItems(BuildContext context, String purchaseCode) async {
    try {
      for (int i = 0; i < _items.length; i++) {
        FormControllers controllers = _controllers[i];
        String selectedItemName = controllers.itemNameController.text;
        String selectedItemCode = controllers.itemCodeController.text;
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
        String id = DateTime.now().millisecondsSinceEpoch.toString();

        await fireStore
            .collection('purchase')
            .doc(purchaseCode)
            .collection("items")
            .doc(id)
            .set({
          'itemName': selectedItemName,
          'itemCode': selectedItemCode,
          'totalAmount': totalAmount,
          'quantity': quantity,
          'priceRate': priceRate,
          'saleRate': saleRate,
          'discount': discount,
          'total': total,
          'uom': selectedUom,
          'stock': selectedStock,
          'plusStock': plusStock,
          Constant.KEY_ITEM_TIMESTAMP: id,
        }).whenComplete(() {
          fireStore.collection("purchase").doc(purchaseCode).update({
            'totalPurchase': MultiController.totalPurchase,
          });
          saveStock();
        });
      }
      _items.clear();
      _controllers.clear();
      print('Data saved to Firestore successfully');
    } catch (error) {
      print('Error saving data to Firestore: $error');
    }
  }

  Future<void> saveStock() async {
    try {
      for (int i = 0; i < _items.length; i++) {
        FormControllers controllers = _controllers[i];
        String itemCode = controllers.itemCodeController.text;
        double stock = double.tryParse(controllers.stockController.text) ?? 0;
        double quantity =
            double.tryParse(controllers.quantityController.text) ?? 0;
        double additionalStock = stock + quantity;

        await fireStore
            .collection(Constant.COLLECTION_ITEMS)
            .doc(itemCode.toString())
            .update({
          'stock': additionalStock.toString(),
          Constant.KEY_PURCHASE_TIMESTAMP:
              DateTime.now().millisecondsSinceEpoch.toString(),
        }).whenComplete(() {
          print('Stock Saved');
        });
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  datePicker(BuildContext context) async {
    DateTime? picDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    joiningDate = DateFormat('dd-MM-yyyy').format(picDate!);
    notifyListeners();
  }
}

// Delete Function

// Future<void> deleteDataFromFireStore(int index) async {
//   try {
//     final QuerySnapshot querySnapshot =
//         await fireStore.collection('purchase').get();
//     final List<DocumentSnapshot> docs = querySnapshot.docs;
//     if (index >= 0 && index < docs.length) {
//       await ref.doc(docs[index].id.toString()).delete();
//       print('Document deleted successfully');
//     } else {
//       print('Invalid index');
//     }
//   } catch (error) {
//     print('Error deleting document: $error');
//   }
//   _items.removeAt(index);
//   notifyListeners();
// }

// int _counter = 0;
//
// String generateUniqueId() {
//   _counter++;
//   return 'buildTextField_$_counter';
// }

// void clearItems() {
//   _items.clear();
//   _controllers.clear();
//   notifyListeners();
// }
