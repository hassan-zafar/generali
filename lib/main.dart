import 'package:flutter/material.dart';
import 'package:generali/screens/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
        Login.routeName: (_) => Login(),
      },
    );
  }
}
