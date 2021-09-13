import 'package:flutter/material.dart';
import 'package:generali/screens/widgets/custom_appbar_background.dart';

class Regenrate extends StatelessWidget {
  const Regenrate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const CustomAppBarBackbround(),
      ],
    );
  }
}
