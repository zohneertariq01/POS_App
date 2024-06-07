import 'package:flutter/cupertino.dart';
import '../utils/constants.dart';

class ItemsDataProvider extends ChangeNotifier {
  List<String> category = [];
  String? selectedCategory;
  String? selectedCategoryId;
  Map<String, String> itemDocumentIds = {};
  void Function(String, String)? onSelectedItemChanged;

  List<String> uom = [];
  String? selectedUom;
  String? selectedUomId;
  Map<String, String> itemUomDocumentIds = {};

  List<String> itemStock = [];
  String? selectedItemStock;
  String? selectedItemStockId;
  Map<String, String> itemStockDocumentIds = {};

  List<String> itemAmount = [];
  String? selectedItemAmount;
  String? selectedItemAmountId;
  Map<String, String> itemAmountDocumentIds = {};

  List<String> itemTotalAmount = [];
  String? selectedItemTotalAmount;
  String? selectedItemTotalAmountId;
  Map<String, String> itemTotalAmountDocumentIds = {};

  List<String> vendor = [];
  String? selectedVendor;
  String? selectedVendorId;
  Map<String, String> vendorDocumentIds = {};
  void Function(String, String)? onSelectedVendorChanged;

  List<String> customer = [];
  String? selectedCustomer;
  String? selectedCustomerId;
  Map<String, String> customerDocumentIds = {};
  void Function(String, String)? onSelectedCustomerChanged;

  List<String> salesMan = [];
  String? selectedSalesMan;
  String? selectedSalesManId;
  Map<String, String> salesManDocumentIds = {};
  void Function(String, String)? onSelectedSalesManChanged;

  List<String> supplyMan = [];
  String? selectedSupplyMan;
  String? selectedSupplyManId;
  Map<String, String> supplyManDocumentIds = {};
  void Function(String, String)? onSelectedSupplyManChanged;

  List<String> itemName = [];
  List<String> itemsID = [];
  List<String> itemQuantity = [];
  List<String> itemPurchasePrice = [];
  List<String> itemSalePrice = [];

  String? selectedItemName;
  String? selectedItemQuantity;
  String? selectedItemPurchasePrice;
  String? selectedItemSalePrice;
  String? selectedItemNameId;
  Map<String, String> itemNameDocumentIds = {};
  void Function(String, String)? onSelectedItemNameChanged;

  List<String> cashMethods = [
    'cash',
    'credit',
    'other',
  ];

  String? selectCashMethod;

  Future<void> fetchCategory() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_CATEGORY).get();
      category = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_CATEGORY_NAME] as String)
          .toList();

      itemDocumentIds = {
        for (var doc in snapshot.docs)
          (doc.data())[Constant.KEY_CATEGORY_NAME] as String: doc.id
      };

      selectedCategory = category[0];
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void setSelectedCategory(String newValue) {
    selectedCategory = newValue;
    selectedCategoryId = itemDocumentIds[newValue];
    notifyListeners();
    if (onSelectedItemChanged != null) {
      onSelectedItemChanged!(newValue,
          selectedCategoryId!); // Pass document ID along with item value
    }
  }

  // UOM
  Future<void> fetchUom() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_UOM).get();
      uom = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_UOM_NAME] as String)
          .toList();
      itemUomDocumentIds = {
        for (var doc in snapshot.docs)
          (doc.data())[Constant.KEY_UOM_NAME] as String: doc.id
      };
      selectedUom = uom[0];
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void setSelectedUom(String newValue) {
    selectedUom = newValue;
    selectedUomId = itemUomDocumentIds[newValue];
    notifyListeners();
    if (onSelectedItemChanged != null) {
      onSelectedItemChanged!(
          newValue, selectedUomId!); // Pass document ID along with item value
    }
  }

  Future<void> fetchVendorName() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_VENDORMAN).get();
      vendor = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_VENDORMAN_NAME] as String)
          .toList();
      vendorDocumentIds = {
        for (var doc in snapshot.docs)
          (doc.data())[Constant.KEY_VENDORMAN_NAME] as String: doc.id
      };
      selectedVendor = vendor[0];
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchCustomerName() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_CUSTOMER).get();
      customer = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_CUSTOMER_NAME] as String)
          .toList();
      customerDocumentIds = {
        for (var doc in snapshot.docs)
          (doc.data())[Constant.KEY_CUSTOMER_NAME] as String: doc.id
      };
      selectedCustomer = customer[0];
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchSalesManName() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_SALESMAN).get();
      salesMan = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_SALESMAN_NAME] as String)
          .toList();
      salesManDocumentIds = {
        for (var doc in snapshot.docs)
          (doc.data())[Constant.KEY_SALESMAN_NAME] as String: doc.id
      };
      selectedSalesMan = salesMan[0];
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchSupplyManName() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_SUPPLYMAN).get();
      supplyMan = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_SUPPLYMAN_NAME] as String)
          .toList();
      supplyManDocumentIds = {
        for (var doc in snapshot.docs)
          (doc.data())[Constant.KEY_SUPPLYMAN_NAME] as String: doc.id
      };
      selectedSupplyMan = supplyMan[0];
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchAllItemElements() async {
    try {
      final snapshot =
          await firestore.collection(Constant.COLLECTION_ITEMS).get();
      itemName = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_NAME] as String)
          .toList();
      itemsID = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_CODE] as String)
          .toList();
      itemQuantity = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_QUANTITY] as String)
          .toList();
      itemPurchasePrice = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_PURCHASE_PRICE] as String)
          .toList();
      itemSalePrice = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_SALE_PRICE] as String)
          .toList();
      itemStock = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_STOCK] as String)
          .toList();
      uom = snapshot.docs
          .map((doc) => doc.data()[Constant.KEY_ITEM_UOM] as String)
          .toList();
      selectedItemName = itemName[0];
      selectedItemNameId = itemsID[0];
      selectedItemQuantity = itemQuantity[0];
      selectedItemPurchasePrice = itemPurchasePrice[0];
      selectedItemSalePrice = itemSalePrice[0];
      selectedItemStock = itemStock[0];
      selectedUom = uom[0];

      print('Selected Item Name: $selectedItemName');
      print('Selected Item ID: $selectedItemNameId');
      notifyListeners();
    } catch (e) {
      print('Error Fetching data: $e');
    }
    notifyListeners();
  }
}
