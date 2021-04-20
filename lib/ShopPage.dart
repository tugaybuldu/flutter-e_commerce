import 'package:flutter/material.dart';
import 'package:e_commerce/WomenScreen.dart';
import 'package:e_commerce/MenScreen.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Tab(
                    child: Text(
                  "Women",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                Tab(
                  child: Text(
                    "Men",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            title: Center(
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              WomenScreen(),
              MenScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
