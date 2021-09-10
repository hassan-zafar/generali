import 'package:flutter/material.dart';
import 'package:generali/utilities/custom_images.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomImages.loginBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
