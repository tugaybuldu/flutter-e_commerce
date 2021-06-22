import 'dart:convert';
import 'dart:typed_data';
import 'dart:io' as Io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/details/Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/category/DressesItemCard.dart';
import 'package:e_commerce/Product.dart';

class DressesScreen extends StatefulWidget {
  @override
  _DressesScreenState createState() => _DressesScreenState();
}

// Product Screen olacak ismi

class _DressesScreenState extends State<DressesScreen> {
  @override
  final _firestore = FirebaseFirestore.instance;

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Product').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List<DocumentSnapshot> listOfDocumentSnap = snapshot.data.docs;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75,
          ),
          itemCount: listOfDocumentSnap.length,
          itemBuilder: (context, index) {
            print(listOfDocumentSnap[index].data()['UrunResim']);

            var thumbImage = Image.asset('assets/b1.jpg');

            if (listOfDocumentSnap[index].data()['UrunResim'] != '') {
              thumbImage = Image.memory(
                  base64Decode(listOfDocumentSnap[index].data()['UrunResim']));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(20.0),
                      // For  demo we use fixed height  and width
                      // Now we dont need them
                      // height: 180,
                      // width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Hero(
                        tag: "${listOfDocumentSnap[index]}",
                        child: thumbImage,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0 / 4),
                  child: Text(
                    // products is out demo list
                    listOfDocumentSnap[index].data()['UrunAd'],
                  ),
                ),
                Text(
                  "\$${listOfDocumentSnap[index].data()['UrunFiyat']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Dresses',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildBody(context),
          ),
        ));
  }
}
