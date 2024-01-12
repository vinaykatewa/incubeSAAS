import 'dart:convert';
import 'dart:typed_data';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';

class ApiCalls {
  Future<String?> postApi(String prompt) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://localhost:5000/test'));
    request.body = json.encode({"prompt": "Who are you"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      safePrint(await response.stream.bytesToString());
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      return jsonResponse["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      safePrint(response.reasonPhrase);
    }
  }

  Future<void> putItemsInS3(String filename, Uint8List bytes) async {
    var base64Str = base64Encode(bytes);
    safePrint('this is base64 that we are passing: $base64Str');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:5000/putItem'));
    request.body = json.encode({"data": base64Str, "name": filename});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      safePrint(await response.stream.bytesToString());
    } else {
      safePrint(response.reasonPhrase);
    }
  }

  Future<String?> getItemByName(String name) async {
    safePrint('In getItemByName, we are providing this name $name');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('http://localhost:5000/getItemMethod?name=$name'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String base64String = await response.stream.bytesToString();
      return base64String;
    } else {
      safePrint(response.reasonPhrase);
    }
  }
}
