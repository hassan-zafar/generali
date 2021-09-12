import 'package:flutter/material.dart';
import 'package:generali/utilities/custom_colors.dart';
import 'package:generali/utilities/utilities.dart';

class HomeCategoiesCardWidget extends StatelessWidget {
  const HomeCategoiesCardWidget({
    required this.title,
    required this.action,
    required this.child,
    Key? key,
  }) : super(key: key);
  final String title;
  final Widget action;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.only(
        top: Utilities.padding,
        left: Utilities.padding,
        right: Utilities.padding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Utilities.buttonBorderRadius / 2,
        ),
        color: CustomColors.darkGrey,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(),
              Text(
                title,
                style: TextStyle(
                  color: CustomColors.greyWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              action,
            ],
          ),
          const Spacer(),
          child,
        ],
      ),
    );
  }
}
