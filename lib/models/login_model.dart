class LoginModel {
  LoginModel({
    this.headers,
    this.sessionId,
    required this.token,
  });
  List<dynamic>? headers;
  String? sessionId;
  String token;

  Map<String, dynamic> toMap() {
    return {
      'headers': headers?.map((x) => x?.toMap()).toList(),
      'sessionId': sessionId,
      'token': token,
    };
  }

  // ignore: sort_constructors_first
  factory LoginModel.fromJson(map) {
    return LoginModel(
      headers: List<dynamic>.from(map['headers'] as List<dynamic>),
      sessionId: map['sessionId'].toString(),
      token: map['token'].toString(),
    );
  }
}
