import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataService {
  DataService._privateConstructor();

  static final DataService _instance = DataService._privateConstructor();

  factory DataService() => _instance;

  static final _baseUrl = "skl.happycu.co";

  Map<String, dynamic> query_string = {};

  Future<Map<String, dynamic>> login(String username, String password) async {
    final String path = '/auth/m/sign-in';
    final Uri url = Uri.https(_baseUrl, path);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> body = jsonDecode(response.body);
        prefs.setString("username", username);
        prefs.setString("password", password);
        prefs.setString("accessToken", body["data"]["accessToken"]);
        return {"status": "success", "text": "login success"};
      } else {
        return {"status": "failed", "text": "login failed"};
      }
    } catch (e) {
      Exception('Exception occurred: $e');
      return {"status": "error", "text": "Exception occurred: $e"};
    }
  }

  Future<Map<String, dynamic>> getScanList(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("accessToken") ?? "";

    final String path = '/v1/ip/m/item';
    final Uri url = Uri.https(_baseUrl, path, {"date": date});

    try {
      final response = await http.get(url, headers: {'Authorization': "Bearer $accessToken"});

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<Map<String, dynamic>> result = [];
        for (var data in body["data"]) {
          result.add({
            "uuid": data["uuid"],
            "hawb": data["hawb"],
            "lastStatus": data["lastStatus"],
          });
        }

        return {"status": "success", "text": "login success", "data": result};
      } else {
        return {"status": "failed", "text": "login failed", "data": null};
      }
    } catch (e) {
      Exception('Exception occurred: $e');
      return {"status": "error", "text": "Exception occurred: $e", "data": null};
    }
  }
}
