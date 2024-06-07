// preview screen
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PreviewScreen extends StatelessWidget {
  final pw.Document doc;
  const PreviewScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        title: Text("Your Invoice Preview"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: PdfPreview(
          build: (PdfPageFormat pageFormat) => doc.save(),
          allowSharing: true,
          allowPrinting: true,
          initialPageFormat: PdfPageFormat.a3,
          pdfFileName: "mydoc.pdf",
        ),
      ),
    );
  }
}
