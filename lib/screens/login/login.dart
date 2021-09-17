import 'package:flutter/material.dart';
import 'package:generali/api/auth_api.dart';
import '../../utilities/custom_colors.dart';
import '../../utilities/custom_images.dart';
import '../../utilities/custom_toast.dart';
import '../../utilities/utilities.dart';
import '../main_scren/main_screen.dart';
import '../widgets/custom_colored_button.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/show_loading.dart';

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
                if (dni.text.isNotEmpty && password.text.isNotEmpty) {
                  showLoading(context);
                  final bool reuslt = await AuthAPI.auth(
                    dni: dni.text,
                    password: password.text,
                  );
                  if (reuslt == true) {
                    if (!mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      MainScreen.routeName,
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    if (!mounted) return;
                    Navigator.of(context).pop();
                    CustomToast.errorToast(message: 'Invalid ID or Password');
                  }
                } else {
                  CustomToast.errorToast(message: 'Please fill the fields');
                }
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
