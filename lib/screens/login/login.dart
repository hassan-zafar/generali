import 'package:flutter/material.dart';
import 'package:generali/api/auth_api.dart';
import 'package:generali/screens/widgets/custom_colored_button.dart';
import 'package:generali/screens/widgets/custom_textformfield.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController dni = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.secondary,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(Utilities.padding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomImages.loginBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.16),
            Image.asset(CustomImages.logo),
            SizedBox(height: size.height * 0.1),
            CustomTextFormField(
              title: 'Username',
              controller: dni,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              title: 'Password',
              controller: password,
              isPassword: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
            ),
            CustomColoredButton(
              onTap: () async {
                await AuthAPI.auth(dni: '77777777B', password: '77777777B');
              },
              child: Text(
                'Enter',
                style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const Spacer(),
            Image.asset(CustomImages.logo),
            const SizedBox(height: 38),
          ],
        ),
      ),
    );
  }
}
