import 'package:flutter/material.dart';
import 'package:generali/screens/home/main_screen.dart';
import 'package:generali/screens/login/login.dart';
import 'package:generali/utilities/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generali',
      theme: ThemeData(
        primaryColor: CustomColors.red,
        iconTheme: IconThemeData(color: CustomColors.lightGrey),
        colorScheme: ColorScheme(
          primary: CustomColors.red,
          primaryVariant: Colors.red,
          secondary: CustomColors.secondary,
          secondaryVariant: Colors.orange,
          surface: CustomColors.red,
          background: CustomColors.greyWhite,
          error: Colors.red,
          onPrimary: CustomColors.secondary,
          onSecondary: CustomColors.red,
          onSurface: CustomColors.secondary,
          onBackground: CustomColors.greyWhite,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: const MainScreen(),
      routes: <String, WidgetBuilder>{
        Login.routeName: (_) => const Login(),
        MainScreen.routeName: (_) => const MainScreen(),
      },
    );
  }
}
