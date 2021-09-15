import 'package:flutter/material.dart';
import 'package:generali/providers/home_slider_provider.dart';
import 'package:generali/screens/chat_bot/chat_bot.dart';
import 'package:generali/screens/login/login.dart';
import 'package:generali/screens/main_scren/main_screen.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<HomeSliderProvider>.value(
          value: HomeSliderProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Generali',
        theme: ThemeData(
          primaryColor: CustomColors.red,
          iconTheme: const IconThemeData(color: Colors.white),
          splashColor: Colors.redAccent,
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
          ChatBot.routeName: (_) => const ChatBot(),
        },
      ),
    );
  }
}
