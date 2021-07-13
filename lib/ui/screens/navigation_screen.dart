import 'package:flutter/material.dart';
import 'package:task/ui/screens/home_screen.dart';
import 'package:task/ui/screens/regisration_screen.dart';
import 'package:task/widgets/export.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final List<Widget> _screens = [
    RegistrationScreen(),
    Scaffold(),
    HomeScreen(),
    RegistrationScreen(),
    Scaffold(),
  ];

  int _selectedIndex = 0;

  ValueNotifier<int> cartCount;

  Future<bool> _onWillPop() async {
    print("on will pop");

    if (_selectedIndex == 0) return true;
    setState(() {
      _selectedIndex = 0;
      print(_selectedIndex);
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
            bottomNavigationBar: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    onTap: (index) => setState(() => _selectedIndex = index),
                    currentIndex: _selectedIndex,
                    selectedFontSize: 12,
                    selectedItemColor: Styles.red,
                    unselectedItemColor: Styles.colorGreyLight,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: ('Favourite')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: ('Favourite')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_box), label: ('Favourite')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.equalizer_outlined),
                          label: ('Favourite')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: ('Favourite'))
                    ],
                  ),
                ))));
  }
}
