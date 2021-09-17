import 'package:flutter/material.dart';
import '../../utilities/custom_colors.dart';
import '../../utilities/utilities.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({
    required this.search,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final TextEditingController search;
  final VoidCallback onTap;
  @override
  _SearchTextFormFieldState createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.all(Utilities.padding),
      padding: EdgeInsets.only(left: Utilities.padding),
      decoration: BoxDecoration(
        color: CustomColors.greyWhite,
        borderRadius: BorderRadius.circular(Utilities.searchBorderRadius),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 9,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      alignment: Alignment.bottomLeft,
      child: TextFormField(
        controller: widget.search,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: double.infinity,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(Utilities.searchBorderRadius),
                  topRight: Radius.circular(Utilities.searchBorderRadius),
                ),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
