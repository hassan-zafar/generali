import 'dart:convert';
import 'package:generali/model/auth.dart';
import 'package:generali/utilities/custom_api.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<void> auth(
      {required String dni, required String password}) async {
    final Map<String, dynamic> _data = <String, dynamic>{
      "dni": dni.trim(),
      "password": password.trim()
    };
    final String _url = '${CustomAPI.base}${CustomAPI.authenticate}';
    //Request API for responce
    final http.Response response = await http.post(
      Uri.parse(_url),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(_data),
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      // final dynamic decodeData = json.decode(response.body);
      final Auth auth = Auth().authFromJson(response.body);
      print('headers: ${auth.headers}');
      print('sessionId: ${auth.sessionId}');
      print('token: ${auth.token}');
      // UserLocalData.setToken(decodeData['token'].toString());
    }
  }
}
