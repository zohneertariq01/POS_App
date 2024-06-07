import 'package:flutter/cupertino.dart';
import '../../../utils/constants.dart';

class RegisterFirebaseProvider with ChangeNotifier {
  Future<void> uploadRegistrationData(
      {required collection,
      required count,
      required name,
      required category,
      required uom,
      required stock,
      required quantity,
      required purchasePrice,
      required salePrice,
      required joiningDate,
      required status,
      required lowStock}) async {
    DateTime dateTime = DateTime.now();
    try {
      await firestore.collection(collection).doc(count.toString()).set({
        Constant.KEY_ITEM_CODE: count.toString(),
        Constant.KEY_ITEM_NAME: name.toString().toLowerCase(),
        Constant.KEY_ITEM_CATEGORY: category.toString(),
        Constant.KEY_ITEM_UOM: uom.toString(),
        Constant.KEY_ITEM_STOCK: stock.toString(),
        Constant.KEY_ITEM_QUANTITY: quantity.toString(),
        Constant.KEY_ITEM_PURCHASE_PRICE: purchasePrice.toString(),
        Constant.KEY_ITEM_SALE_PRICE: salePrice.toString(),
        Constant.KEY_ITEM_JOIN_DATE: joiningDate.toString(),
        Constant.KEY_STATUS: status.toString(),
        Constant.KEY_ITEM_LOW_STOCK: lowStock.toString(),
        Constant.KEY_ITEM_TIMESTAMP: dateTime.millisecondsSinceEpoch.toString(),
      });
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> updateRegistrationData(
      {required collection,
      required count,
      required name,
      required category,
      required uom,
      required stock,
      required quantity,
      required purchasePrice,
      required salePrice,
      required joiningDate,
      required status}) async {
    try {
      await firestore.collection(collection).doc(count.toString()).update({
        Constant.KEY_ITEM_NAME: name.toString().toLowerCase(),
        Constant.KEY_ITEM_CATEGORY: category.toString(),
        Constant.KEY_ITEM_UOM: uom.toString(),
        Constant.KEY_ITEM_STOCK: stock.toString(),
        Constant.KEY_ITEM_QUANTITY: quantity.toString(),
        Constant.KEY_ITEM_PURCHASE_PRICE: purchasePrice.toString(),
        Constant.KEY_ITEM_SALE_PRICE: salePrice.toString(),
        Constant.KEY_ITEM_JOIN_DATE: joiningDate.toString(),
        Constant.KEY_STATUS: status.toString(),
      });
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> deleteRegistrationData(
      {required collection, required id}) async {
    try {
      await firestore.collection(collection).doc(id.toString()).delete();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
