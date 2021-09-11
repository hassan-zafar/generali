import 'package:flutter/material.dart';
import 'package:generali/screens/widgets/custom_appbar_background.dart';
import 'package:generali/screens/widgets/custom_circular_profile_image.dart';
import 'package:generali/screens/widgets/search_textformfield.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: SizedBox(width: 120, child: Image.asset(CustomImages.logo)),
          centerTitle: false,
          actions: <Widget>[
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 30,
                child: Image.asset(CustomImages.tutorIconWhite),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 28,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            const CustomCircularProfileImage(imageURL: ''),
            SizedBox(width: Utilities.padding),
          ],
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const CustomAppBarBackbround(),
                SearchTextFormField(
                  search: _search,
                  onTap: () {},
                ),
                Container(),
              ],
            ),
          ],
        ));
  }
}
