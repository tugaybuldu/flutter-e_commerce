import 'package:e_commerce/CartPage.dart';
import 'package:e_commerce/HomePage.dart';
import 'package:e_commerce/ProfilePage.dart';
import 'package:e_commerce/ShopPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce/BagPage.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  List<Widget> _children = <Widget>[
    HomePage(),
    ShopPage(),
    BagPage(),
    ProfilePage()
  ];
  void onTappedbar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTappedbar,
        currentIndex: _currentIndex,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                'Home',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text(
                'Shop',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              title: Text(
                'Bag',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                'Profile',
              )),
        ],
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.brown[900],
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
