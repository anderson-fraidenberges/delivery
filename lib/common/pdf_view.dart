import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'custom_drawer/custom_drawer.dart';

class PdfView extends StatelessWidget {
  PdfView(this.pdfDocument);
  
  final PDFDocument pdfDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(""), centerTitle: true),
        drawer: CustomDrawer(),
        backgroundColor: Colors.blue.shade50,
        body: PDFViewer(document: pdfDocument, zoomSteps: 10));
  }
}
