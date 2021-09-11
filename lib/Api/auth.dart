import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../utilities/global_variable.dart' as globals;
// ignore: library_prefixes
import '../utilities/shared_pref.dart' as sharedData;

Future<LoginModel> authPost(String dni, String password) async {
  final Map<String, String> object = <String, String>{
    'dni': dni,
    'password': password
  };
  final String url = '${globals.auth_url}authenticate';
  @override
  final http.Response response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(object),
  );
  // ignore: always_specify_types
  final decodeData = json.decode(response.body);
  globals.token = decodeData['token'].toString();
  sharedData.addStringToSF('token', decodeData['token'].toString());
  return LoginModel.fromJson(jsonDecode(response.body));
}
