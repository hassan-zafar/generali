import 'package:flutter/material.dart';
import 'package:generali/screens/home/pages/home/home.dart';
import 'bottom_navigation_bar_widget.dart';

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
    const Center(child: Text('Page 2')),
    const Center(child: Text('Page 3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(onTab: _onItemTapped),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
