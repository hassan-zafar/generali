import 'dart:convert';
import 'package:generali/models/courses_model.dart';
import 'package:http/http.dart' as http;
import '../utilities/global_variable.dart' as globals;
// ignore: library_prefixes
import '../utilities/shared_pref.dart' as sharedData;

Future<CourseModel> getCourses(int _limit,int _page) async {
  // ignore: always_specify_types
  final token = sharedData.getStringValuesSF('token').toString();
  var data =token;
  final String url = '${globals.v2_url}my-courses?_limit=$_limit&_page=$_page';
  @override
    final http.Response response = await http.get(
    Uri.parse(url),
     // ignore: always_specify_types
     headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      },
  );
  return CourseModel.fromJson(jsonDecode(response.body));
}
