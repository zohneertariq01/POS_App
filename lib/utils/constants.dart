import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const drawerBackground = Color(0xFF212332);
const hoverColor = Color(0xFFFFB703);
// const hoverColor = Color(0xFFfe9f42);

const defaultPadding = 18.0;
const defaultBorderRadius = 10.0;
const defaultDrawerHeadHeight = 20.0;

// SIDE BAR SVG IMAGE
const DASHBOARD_SVG = "assets/icons/menu_dashboard.svg";

//firebase firestore
var firestore = FirebaseFirestore.instance;

class Constant {
  static const COLLECTION_CATEGORY = "category";
  static const KEY_CATEGORY_ID = "categoryId";
  static const KEY_CATEGORY_NAME = "name";
  static const KEY_CATEGORY_DESC = "desc";

  static const KEY_STATUS = "status";

  // Supply Man
  static const COLLECTION_SUPPLYMAN = "SupplyMan";
  static const KEY_SUPPLYMAN_CODE = "code";
  static const KEY_SUPPLYMAN_NAME = "name";
  static const KEY_SUPPLYMAN_PHONE = "phone";
  static const KEY_SUPPLYMAN_ADDRESS = "address";
  static const KEY_SUPPLYMAN_JOIN_DATE = "joinDate";
  static const KEY_SUPPLYMAN_TIMESTAMP = "timestamp";

  // Vendor Man
  static const COLLECTION_VENDORMAN = "Vendor";
  static const KEY_VENDORMAN_CODE = "code";
  static const KEY_VENDORMAN_NAME = "name";
  static const KEY_VENDORMAN_PHONE = "phone";
  static const KEY_VENDORMAN_ADDRESS = "address";
  static const KEY_VENDORMAN_JOIN_DATE = "joinDate";
  static const KEY_VENDORMAN_TIMESTAMP = "timestamp";

  // Customer
  static const COLLECTION_CUSTOMER = "Customer";
  static const KEY_CUSTOMER_CODE = "code";
  static const KEY_CUSTOMER_NAME = "name";
  static const KEY_CUSTOMER_PHONE = "phone";
  static const KEY_CUSTOMER_ADDRESS = "address";
  static const KEY_CUSTOMER_JOIN_DATE = "joinDate";
  static const KEY_CUSTOMER_TIMESTAMP = "timestamp";

  // UOM Registration
  static const COLLECTION_UOM = "uom";
  static const KEY_UOM_ID = "id";
  static const KEY_UOM_NAME = "name";
  static const KEY_UOM_DESC = "desc";

  // Sales Man
  static const COLLECTION_SALESMAN = "SalesMan";
  static const KEY_SALESMAN_CODE = "code";
  static const KEY_SALESMAN_NAME = "name";
  static const KEY_SALESMAN_PHONE = "phone";
  static const KEY_SALESMAN_ADDRESS = "address";
  static const KEY_SALESMAN_JOIN_DATE = "joinDate";
  static const KEY_SALESMAN_TIMESTAMP = "timestamp";

  // Items Registration
  static const COLLECTION_ITEMS = "items";
  static const KEY_ITEM_NAME = "name";
  static const KEY_ITEM_CODE = "code";
  static const KEY_ITEM_CATEGORY = "category";
  static const KEY_ITEM_UOM = "uom";
  static const KEY_ITEM_STOCK = "stock";
  static const KEY_ITEM_QUANTITY = "quantity";
  static const KEY_ITEM_PURCHASE_PRICE = "purchasePrice";
  static const KEY_ITEM_SALE_PRICE = "salePrice";
  static const KEY_ITEM_JOIN_DATE = 'joiningDate';
  static const KEY_ITEM_TIMESTAMP = "timestamp";
  static const KEY_ITEM_LOW_STOCK = "lowStock";

  // Purchase
  static const COLLECTION_PURCHASE = 'purchase';
  static const KEY_PURCHASE_CODE = 'code';
  static const KEY_PURCHASE_TIMESTAMP = 'timestamp';

  // Sales
  static const COLLECTION_SALES = 'sale';
  static const KEY_SALES_TIMESTAMP = 'timestamp';
}
