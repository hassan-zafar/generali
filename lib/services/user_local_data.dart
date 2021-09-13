import 'package:shared_preferences/shared_preferences.dart';

class UserLocalData {
  static late SharedPreferences? _preferences;
  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static void signout() => _preferences!.clear();

  static const String _dni = 'EMAILKEY';
  static const String _displayNameKey = 'DISPLAYNAMEKEY';
  static const String _imageUrlKey = 'IMAGEURLKEY';
  static const String _token = 'TOKEN';

  //s
  // Setters
  //
  static Future<void> setToken(String token) async =>
      _preferences!.setString(_token, token);
  static Future<void> setDNI(String dni) async =>
      _preferences!.setString(_dni, dni);
  static Future<void> setDisplayName(String name) async =>
      _preferences!.setString(_displayNameKey, name);
  static Future<void> setImageUrl(String url) async =>
      _preferences!.setString(_imageUrlKey, url);
  //
  // Getters
  //
  static String get getToken => _preferences!.getString(_token) ?? '';
  static String get getDNI => _preferences!.getString(_dni) ?? '';
  static String get getDisplayName =>
      _preferences!.getString(_displayNameKey) ?? '';
  static String get getImageUrl => _preferences!.getString(_imageUrlKey) ?? '';
}
