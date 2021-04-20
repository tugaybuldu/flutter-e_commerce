import 'package:flutter/material.dart';
import 'package:e_commerce/category/DressesItemCard.dart';
import 'package:e_commerce/Product.dart';

class DressesScreen extends StatefulWidget {
  @override
  _DressesScreenState createState() => _DressesScreenState();
}

class _DressesScreenState extends State<DressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dresses'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => DressesItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            //  builder: (context) => DetailsScreen(
                            //  product: products[index],
                            ),
                      )),
            )),
      ),
    );
  }
}
