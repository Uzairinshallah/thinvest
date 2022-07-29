import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:thinvest/Extras/pdf/pdfView.dart';
import 'package:thinvest/models/reports_model.dart';

class InvoicePDF {
  ReportsModel reportsModel;
  double totalInvoice = 0;

  InvoicePDF(BuildContext context, {required this.reportsModel}) {
    // print(reportsModel.vehicleList.length);
    generateData(context);
  }

  generateData(BuildContext context) async {
    // calculatePdf();
    await generatePdf();
    // sendPdf();
    save(context);
  }

  final pdf = pw.Document();
  late double width, height;

  generatePdf() async {
    final byteData = (await rootBundle.load('assets/icons/thinvest.png'))
        .buffer
        .asUint8List();
    final image = pw.MemoryImage(
      byteData,
    );
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Container(
                padding: pw.EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                child: pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Image(
                    image,
                    width: 100,
                  ),
                ),
              ),
              pw.Row(
                mainAxisSize: pw.MainAxisSize.max,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Trade Report',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        pw.Text('30 OSHEA CRESCEST AJAX ON L 1 T 4W7s',
                            style: pw.TextStyle(
                              fontSize: 8,
                            )),
                        pw.Text('(800) 772-2663 ',
                            style: pw.TextStyle(
                              fontSize: 8,
                            )),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text(
                                'Invoice No.'.toUpperCase(),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 8,
                                ),
                              ),
                              pw.Text(
                                'Payment Via'.toUpperCase(),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 8,
                                ),
                              ),
                              pw.Text(
                                'Date'.toUpperCase(),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                reportsModel.returnn!,
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                              pw.Text(
                                reportsModel.yearlyReturn!,
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                              pw.Text(
                                'time',
                                style: const pw.TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 10),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                width: double.infinity,
                height: .1,
                color: PdfColor.fromHex('#595959'),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                  color: PdfColor.fromHex('#000000'),
                  child: pw.Row(children: [
                    pw.Expanded(child: pw.Text('aaaaa')),
                    pw.Expanded(child: pw.Text('aaaaa')),
                    pw.Expanded(child: pw.Text('aaaaa')),
                  ])),
              pw.SizedBox(
                height: 15,
              ),
              pw.Column(
                children: [
                  pw.Container(
                    padding: pw.EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    // color: PdfColor.fromHex('#FF0000'),
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.max,
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Vehicle'.toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('#000000')),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Condition'.toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('#000000')),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            'Initial Deposit'.toUpperCase(),
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('#000000')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.SizedBox(),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      padding: pw.EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      color: PdfColor.fromHex('#D9D9D9'),
                      child: pw.Text(
                        ' Total Deposit'.toUpperCase(),
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 8,
                            color: PdfColor.fromHex('#000000')),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 1),
                  pw.Expanded(
                    child: pw.Container(
                      padding:
                          pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      color: PdfColor.fromHex('#D9D9D9'),
                      child: pw.Row(
                        children: [
                          pw.Text(
                            '  \$${totalInvoice.toStringAsFixed(0)}',
                            style: pw.TextStyle(
                                fontSize: 8,
                                color: PdfColor.fromHex('#000000')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 25),
              pw.Text(
                'Paid amount is the initial deposit on your total tariff to confirm your order, remaining amount is payable to the driver at the time of delivery. The quoted amount is the estimated price based on the real time market value\n\n'
                'All sales are final. The fees associated with your purchase will appear on your credit card statement through the identifier Rapid Car Ship. All prices displayed on the site are quoted in U.S Dollars, are payable in U.S Dollars and are valid and effective only in the United States. Failure to use the service does not constitute a basis for refusing to pay any of the associated charges',
                style: pw.TextStyle(
                    fontSize: 7, color: PdfColor.fromHex('#000000')),
              ),
            ],
          );
        }));
  }

  save(BuildContext context) async {
    var d = await getTemporaryDirectory();
    final file = File(d.path + "/example.pdf");
    File s = await file.writeAsBytes(await pdf.save());
    // sendPdf(await pdf.save());
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => PdfView(s)));
  }

// void calculatePdf() {
//   for( var element in reportsModel.vehicleList )
//   {
//     totalInvoice +=element.initialDeposit;
//   }
// }

}
