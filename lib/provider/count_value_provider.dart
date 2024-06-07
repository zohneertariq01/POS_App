import 'package:flutter/cupertino.dart';
import '../utils/constants.dart';

class CountValueProvider with ChangeNotifier {
  int _countValue = 1;

  int get countValue => _countValue;

  Future<void> fetchCountValue() async {
    try {
      final value = await firestore.collection("countValue").doc("count").get();
      if (value.exists) {
        _countValue = int.parse(value.get("counter").toString());
      } else {
        _countValue = 1;
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  Future<void> updateCountValue({required count}) async {
    try {
      await firestore
          .collection("countValue")
          .doc("count")
          .update({"counter": count.toString()});
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  // category firebase collection
  Future<void> uploadCategory(
      {required count, required name, required description}) async {
    DateTime time = DateTime.now();
    try {
      await firestore
          .collection(Constant.COLLECTION_CATEGORY)
          .doc(count.toString())
          .set({
        Constant.KEY_CATEGORY_ID: count.toString(),
        Constant.KEY_CATEGORY_NAME: name.toString().toLowerCase(),
        Constant.KEY_CATEGORY_DESC: description.toString(),
        "timestamp": time.millisecondsSinceEpoch.toString(),
      });
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  Future<void> updateCategory(
      {required code, required name, required description}) async {
    try {
      await firestore
          .collection(Constant.COLLECTION_CATEGORY)
          .doc(code.toString())
          .update({
        Constant.KEY_CATEGORY_NAME: name.toString().toLowerCase(),
        Constant.KEY_CATEGORY_DESC: description.toString(),
      });
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  Future<void> deleteCategory({required id}) async {
    try {
      await firestore
          .collection(Constant.COLLECTION_CATEGORY)
          .doc(id.toString())
          .delete();
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }
}
