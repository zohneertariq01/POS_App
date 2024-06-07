import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/text_widget.dart';
import '../purchase_screen.dart';

class PurchaseItemList extends StatelessWidget {
  final String purchaseCode;
  const PurchaseItemList({Key? key, required this.purchaseCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("Purchase Code: ${purchaseCode}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text('Purchase Item Details'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              StreamBuilder(
                stream: firestore
                    .collection('purchase')
                    .doc(purchaseCode)
                    .collection("items")
                    .orderBy(Constant.KEY_ITEM_TIMESTAMP, descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: hoverColor,
                          ),
                        )
                      : snapshot.data!.docs.isEmpty
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "No Purchase Found",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: PaginatedDataTable(
                                  header: TextWidget(
                                    text:
                                        "Total Purchases: ${snapshot.data!.docs.length}",
                                    size: 20,
                                    color: Colors.white,
                                    isBold: false,
                                  ),
                                  headingRowColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      return hoverColor; // Default color
                                    },
                                  ),
                                  columnSpacing: 20.0,
                                  arrowHeadColor: Colors.white,
                                  rowsPerPage: snapshot.data!.docs.length > 10
                                      ? 10
                                      : snapshot.data!.docs.length,
                                  columns: const [
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Item Code",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Item Name",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Price Rate",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Sale Rate",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Quantity",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Stock",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    //2
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Total Stock",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    //3
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Amount",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    //4
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Discount",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                    //5
                                    DataColumn(
                                      label: TextWidget(
                                        text: "Total Amount",
                                        color: Colors.black,
                                        size: 14,
                                        isBold: true,
                                      ),
                                    ),
                                  ],
                                  source: DataTableSourceImpl(
                                      items: snapshot.data!.docs,
                                      length: snapshot.data!.docs.length,
                                      context: context)),
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataTableSourceImpl extends DataTableSource {
  final items;
  final length;
  final context;

  DataTableSourceImpl(
      {required this.items, required this.length, required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      color: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          return bgColor; // Default color
        },
      ),
      cells: [
        DataCell(
          TextWidget(
            text: items[index]['itemCode'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['itemName'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['priceRate'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['saleRate'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['quantity'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['stock'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['plusStock'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['total'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['discount'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['totalAmount'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
