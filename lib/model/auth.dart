import 'dart:convert';
class Auth {
  Auth({this.headers, this.sessionId, this.token});

  final List<dynamic>? headers;
  final dynamic sessionId;
  final String? token;

  // ignore: sort_constructors_first
  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        headers: List<dynamic>.from(json['headers'] as List<dynamic>),
        sessionId: json['sessionId'],
        token: json['token'].toString(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'headers': List<dynamic>.from(headers!.map((dynamic x) => x)),
        'sessionId': sessionId,
        'token': token,
      };

  Auth authFromJson(String str) =>
      Auth.fromJson(json.decode(str) as Map<String, dynamic>);

  String authToJson(Auth data) => json.encode(data.toJson());
}
