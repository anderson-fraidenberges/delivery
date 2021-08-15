import 'dart:io';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfCreator {
  static Future<PDFDocument> create(pw.Widget bodyDocument, String fileName) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(build: (pw.Context context) => bodyDocument),
    );

    final bytes = await pdf.save();    
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');

    await file.writeAsBytes(bytes);

    PDFDocument doc = await PDFDocument.fromFile(file);
    return doc;
  }
}
