import 'package:e_commerce/ItemCard.dart';
import 'package:e_commerce/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kDefaultPaddin = 20.0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Home Yazısı

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF0A1034),
                      fontWeight: FontWeight.bold),
                ),
              ),

              // Banner

              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Container(
                  width: 370,
                  height: 150,
                  padding:
                      EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/b1.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),

              // New Yazısı

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "New",
                  style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF0A1034),
                      fontWeight: FontWeight.bold),
                ),
              ),

              // New Ürünleri

              Expanded(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ItemCard(
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
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
