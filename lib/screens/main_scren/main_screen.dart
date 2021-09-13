import 'package:flutter/material.dart';
import 'package:generali/screens/main_scren/pages/aprenda/aprenda.dart';
import 'package:generali/screens/main_scren/pages/regenrate/regenrate.dart';
import 'package:generali/screens/widgets/custom_circular_profile_image.dart';
import 'package:generali/utilities/custom_images.dart';
import 'package:generali/utilities/utilities.dart';

import 'bottom_navigation_bar_widget.dart';
import 'pages/home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Aprenda(),
    const Regenrate(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(width: 120, child: Image.asset(CustomImages.logo)),
        centerTitle: false,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // TODO: on Tutor Icon click
            },
            child: SizedBox(
              width: 30,
              child: Image.asset(CustomImages.tutorIconWhite),
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: on notification button press
            },
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
      bottomNavigationBar: BottomNavigationBarWidget(onTab: _onItemTapped),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat_outlined, color: Colors.white),
      ),
    );
  }
}
