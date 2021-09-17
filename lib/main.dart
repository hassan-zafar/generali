import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/home_slider_provider.dart';
import 'screens/chat_bot/chat_bot.dart';
import 'screens/login/login.dart';
import 'screens/main_scren/main_screen.dart';
import 'screens/profile/profile.dart';
import 'services/user_local_data.dart';
import 'utilities/custom_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserLocalData.init();
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
        debugShowCheckedModeBanner: false,
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
        home: (UserLocalData.getToken.isEmpty)
            ? const Login()
            : const MainScreen(),
        // home: const Login(),
        routes: <String, WidgetBuilder>{
          Login.routeName: (_) => const Login(),
          MainScreen.routeName: (_) => const MainScreen(),
          Profile.routeName: (_) => const Profile(),
          ChatBot.routeName: (_) => const ChatBot(),
        },
      ),
    );
  }
}
