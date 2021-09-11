import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String key,String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key,data);
}

getStringValuesSF(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? stringValue = prefs.getString(key);
  return stringValue;
}