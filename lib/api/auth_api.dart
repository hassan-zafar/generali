import 'dart:convert';
import 'package:generali/model/auth.dart';
import 'package:generali/services/user_local_data.dart';
import 'package:generali/utilities/custom_api.dart';
import 'package:generali/utilities/custom_toast.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<bool> auth(
      {required String dni, required String password}) async {
    final Map<String, dynamic> _data = <String, dynamic>{
      "dni": dni.trim(),
      "password": password.trim()
    };
    final String _url = '${CustomAPI.base}${CustomAPI.authenticate}';
    final http.Response response = await http.post(
      Uri.parse(_url),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(_data),
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      try {
        final Auth auth = Auth().authFromJson(response.body);
        if (auth.token != null && auth.token != null) {
          UserLocalData.setToken(auth.token!);
          print(auth.token);
          return true;
        } else {
          return false;
        }
      } catch (e) {
        CustomToast.errorToast(message: e.toString());
        return false;
      }
    } else {
      return false;
    }
  }
}
