import 'package:e_commerce/category/DressesScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ShopPage.dart';

class WomenScreen extends StatefulWidget {
  @override
  _WomenScreenState createState() => _WomenScreenState();
}

class _WomenScreenState extends State<WomenScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            subtitle: Text(
              'Dresses',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DressesScreen())),
          ),
        ),
        Card(
          child: ListTile(
            subtitle: Text(
              'Pants',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
