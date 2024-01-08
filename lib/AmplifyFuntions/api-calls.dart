import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<String?> postApi(String prompt) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBv-635iuGgse8YjaKz1The0LFyNgS6Gh0'));
    request.body = json.encode({
      "contents": [
        {
          "parts": [
            {"text": "$prompt in 50 words"}
          ]
        }
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      // safePrint('this is the response body: $responseBody');
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      // safePrint('this is the decoded jsonResponse: $responseBody');
      return jsonResponse["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
