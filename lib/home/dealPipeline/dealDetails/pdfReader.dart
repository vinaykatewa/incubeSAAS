// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

class PdfReaderIFrame extends StatefulWidget {
  final String base64String;
  PdfReaderIFrame({super.key, required this.base64String}) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();

      String cleanString = base64String;
      if (cleanString.startsWith('"') && cleanString.endsWith('"')) {
        cleanString = cleanString.substring(1, cleanString.length - 1);
      }
      var decodedPDF = base64Decode(cleanString);
      var blob = html.Blob([decodedPDF], 'application/pdf');
      var url = html.Url.createObjectUrlFromBlob(blob);

      iframe.src = url;
      return iframe;
    });
  }

  @override
  State<PdfReaderIFrame> createState() => _PdfReaderIFrameState();
}

class _PdfReaderIFrameState extends State<PdfReaderIFrame> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        width: screenWidth * .85,
        height: screenHeight * 0.8,
        child: const HtmlElementView(viewType: 'iframe'));
  }
}
