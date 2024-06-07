import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/screens/purchase/provider/purchase_list.dart';

import '../../../utils/constants.dart';
import '../../../utils/text_widget.dart';

class PurchaseList extends StatelessWidget {
  const PurchaseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        StreamBuilder(
          stream: firestore
              .collection('purchase')
              .orderBy(Constant.KEY_PURCHASE_TIMESTAMP, descending: false)
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
                                fontSize: 12, fontWeight: FontWeight.bold),
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
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
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
                                  text: "Code",
                                  color: Colors.black,
                                  size: 14,
                                  isBold: true,
                                ),
                              ),
                              DataColumn(
                                label: TextWidget(
                                  text: "Date",
                                  color: Colors.black,
                                  size: 14,
                                  isBold: true,
                                ),
                              ),
                              DataColumn(
                                label: TextWidget(
                                  text: "Payment Via",
                                  color: Colors.black,
                                  size: 14,
                                  isBold: true,
                                ),
                              ),
                              DataColumn(
                                label: TextWidget(
                                  text: "Remarks",
                                  color: Colors.black,
                                  size: 14,
                                  isBold: true,
                                ),
                              ),
                              DataColumn(
                                label: TextWidget(
                                  text: "Invoice Type",
                                  color: Colors.black,
                                  size: 14,
                                  isBold: true,
                                ),
                              ),
                              DataColumn(
                                label: TextWidget(
                                  text: "Action",
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
            text: items[index]['purchaseCode'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['date'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['paymentVia'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['remarks'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          TextWidget(
            text: items[index]['invoiceType'].toString(),
            color: Colors.white,
            size: 14.0,
            isBold: false,
          ),
        ),
        DataCell(
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PurchaseItemList(
                            purchaseCode: items[index]['purchaseCode'],
                          )));
            },
            child: TextWidget(
              text: 'View',
              color: Colors.white,
              size: 14.0,
              isBold: false,
            ),
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
