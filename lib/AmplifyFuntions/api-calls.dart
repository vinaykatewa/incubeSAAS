import 'dart:convert';
import 'dart:typed_data';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';

class ApiCalls {
  Future<List<Map<String, dynamic>>> googleSheetGetData() async {
    var request =
        http.Request('GET', Uri.parse('http://localhost:5000/getSheetData'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      Map<String, dynamic> responseJson = jsonDecode(responseString);
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(responseJson['data']);
      return data;
    } else {
      safePrint(response.reasonPhrase);
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getSheetById(String id) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:5000/fetchData'));
    request.body = json.encode({"id": id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      List<dynamic> responseJson = jsonDecode(responseString);
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(responseJson[0]['data']);
      return data;
    } else {
      safePrint(response.reasonPhrase);
      return [];
    }
  }

  Future sheetList(String sheetId) async {
    List<Map<String, dynamic>> f = [];
    final url = Uri.parse('http://localhost:5000/fetchData');

    final response = await http.post(
      url,
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': sheetId
        // 'key2': 'value2',
      }),
    );

    if (response.statusCode == 200) {
      final t = jsonDecode(response.body);
      // strtpLists.clear();
      // safePrint(List<Map<String, dynamic>>.from(t));
      return List<Map<String, dynamic>>.from(t);
    } else {
      // isLoading = false;
      print('Request failed with status: ${response.statusCode}');
      return f;
    }
  }

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
    return null;
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

  Future<void> putUserImage(String filename, Uint8List bytes) async {
    var base64Str = base64Encode(bytes);
    safePrint('this is base64 that we are passing: $base64Str');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:5000/putUserImage'));
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
    return null;
  }

  Future<String?> getUserImage(String name) async {
    safePrint('In getItemByName, we are providing this name $name');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('http://localhost:5000/getUserImage?name=$name'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String base64String = await response.stream.bytesToString();
      return base64String;
    } else {
      safePrint(response.reasonPhrase);
    }
    return null;
  }
}
