import 'dart:math';
import 'package:delivery/models/itemCart.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

class OrderPdf {
  static pw.Widget CreateBody(List<ItemCart> items, num totalValue) {
    Random rnd = new Random();
    String orderNumber = rnd.nextInt(999).toString().padLeft(6, "0");
    var formatter = new DateFormat('dd/MM/yyyy hh:mm');
    String currentDateFormatted = formatter.format(DateTime.now());

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text("Comprovante do pedido #${orderNumber}", style: pw.TextStyle(fontSize: 20))),
        pw.SizedBox(height: 50),
        pw.Expanded(
            flex: 1,
            child: pw.Column(
                children: items
                    .map((e) => pw.Padding(
                        padding: pw.EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Align(
                                  alignment: pw.Alignment.topLeft,
                                  child: pw.Text(e.name,
                                      textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 16))),
                              pw.Align(
                                  alignment: pw.Alignment.topRight,
                                  child: pw.Text(
                                      "${e.quantity.toString()} x  R\$ ${e.price.toStringAsFixed(2)} = ${(e.quantity * e.price).toStringAsFixed(2)}", style: pw.TextStyle(fontSize: 16)))
                            ])))
                    .toList())),
        pw.Divider(height: 20),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Align(
                  alignment: pw.Alignment.topRight,
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 10),
                    child: pw.Text('Data: ${currentDateFormatted}', style: pw.TextStyle(fontSize: 16)),
                  )),
              pw.Align(
                  alignment: pw.Alignment.topRight,
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 10),
                    child: pw.Text('Total: ${totalValue.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 16)),
                  ))
            ]),
      ],
    );
  }
}
