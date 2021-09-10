import 'package:flutter/material.dart';
import 'package:generali/utilities/utilities.dart';

class CustomColoredButton extends StatelessWidget {
  const CustomColoredButton({
    required this.child,
    required this.onTap,
    this.color = Colors.white,
    this.padding = 8,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final double padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: padding),
        padding: EdgeInsets.symmetric(vertical: padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Utilities.buttonBorderRadius),
        ),
        child: child,
      ),
    );
  }
}
