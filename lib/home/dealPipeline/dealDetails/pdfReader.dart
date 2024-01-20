import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
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
      safePrint('this is the string: $base64String');
      if (cleanString.startsWith('"') && cleanString.endsWith('"')) {
        cleanString = cleanString.substring(1, cleanString.length - 1);
      }
      try {
        var decodedPDF = base64Decode(cleanString);
        var blob = html.Blob([decodedPDF], 'application/pdf');
        var url = html.Url.createObjectUrlFromBlob(blob);

        iframe.src = url;
      } catch (e) {
        print('Error decoding Base64 string: $e');
      }
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
