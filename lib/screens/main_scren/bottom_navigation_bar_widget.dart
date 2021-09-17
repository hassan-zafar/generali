import 'package:flutter/material.dart';
import '../../utilities/custom_colors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    required this.onTab,
  });
  final Function onTab;

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      widget.onTab(index);
      setState(() {
        _selectedIndex = index;
      });
    }

    return BottomNavigationBar(
      unselectedItemColor: CustomColors.lightGrey,
      selectedItemColor: Theme.of(context).primaryColor,
      showUnselectedLabels: true,
      onTap: (int value) => _onItemTapped(value),
      currentIndex: _selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Aprenda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Regenrate',
        ),
      ],
    );
  }
}
