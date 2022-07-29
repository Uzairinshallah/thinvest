import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:uc_pdfview/uc_pdfview.dart';

class PdfView extends StatefulWidget {
  final File file;

  const PdfView(this.file, {Key? key}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  PDFDocument? doc;

  @override
  void initState() {
    // PDFDocument.fromFile(widget.file).then((value){
    //   doc = value;
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UCPDFView(
        filePath: widget.file.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          // setState(() {
          //   pages = _pages;
          //   isReady = true;
          // });
        },
        onError: (error) {
          print(error.toString());
          if (error
              .toString()
              .contains("Password required or incorrect password.")) {
            // Show your Password Dialog supported both Android and IOS
          }
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      ),
    );
  }
}
