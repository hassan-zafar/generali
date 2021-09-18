import 'dart:convert';
import 'package:generali/model/news.dart';
import 'package:generali/services/user_local_data.dart';
import 'package:http/http.dart' as http;

class NewsAPI {
  Future<void> getNews() async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${UserLocalData.getToken}'
    };
    final http.Request request = http.Request(
      'GET',
      Uri.parse(
        'https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings?_limit=220&_page=1',
      ),
    );

    request.headers.addAll(headers);

    final http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final String respStr = await response.stream.bytesToString();
      final News _news =
          News.fromJson(json.decode(respStr) as Map<String, dynamic>);
      print('Content Length: ${_news.content!.length}');
    } else {
      print('Content Length: false');
      print(response.reasonPhrase);
    }
  }
}
