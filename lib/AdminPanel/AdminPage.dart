import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/category.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            subtitle: Text(
              'Ürün Ekle',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => UrunEkle())),
          ),
        ),
        Card(
          child: ListTile(
            subtitle: Text(
              'Kategori Ekle',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}

class UrunEkle extends StatefulWidget {
  @override
  _UrunEkleState createState() => _UrunEkleState();
}

class _UrunEkleState extends State<UrunEkle> {
  final _firestore = FirebaseFirestore.instance;
  String selectedPath = "";
  String selectedCategory = "";
  TextEditingController urunAd = TextEditingController();
  TextEditingController urunAdet = TextEditingController();
  TextEditingController urunBilgi = TextEditingController();
  TextEditingController urunBoyut = TextEditingController();
  TextEditingController urunFiyat = TextEditingController();
  TextEditingController urunKategori = TextEditingController();
  TextEditingController urunRenk = TextEditingController();
  TextEditingController urunResim = TextEditingController();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getCategories();

    super.didChangeDependencies();
  }

  void _openFileExplorer() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ürün resmi eklendi',
          ),
          duration: Duration(seconds: 2),
        ),
      );

      setState(() {
        selectedPath = result.files.first.path;
      });
    } else {
      // User canceled the picker
    }
  }

  Future<void> getCategories() async {
    var ref = _firestore.collection('Categories').get().then((value) {
      setState(() {
        selectedCategory = value.docs.first.id;
      });

      List<Category> newCategories = [];
      value.docs.forEach((element) {
        var newCategory = new Category();
        newCategory.id = element.id;
        newCategory.name = element.data()["Name"];

        newCategories.add(newCategory);
      });

      print(newCategories);
      setState(() {
        categories = newCategories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference productRef = _firestore.collection('Product');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ürün Ekle',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Form(
                    child: Column(
                      children: [
                        DropdownButtonFormField<Category>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 17.5),
                            labelText: 'Kategori',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(203, 203, 205, 1)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(203, 203, 205, 1),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(58, 122, 178, 1),
                                  width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(203, 203, 205, 1),
                                  width: 1.0),
                            ),
                          ),
                          isExpanded: true,
                          value: categories.first,
                          onChanged: (Category newValue) {
                            selectedCategory = newValue.id;
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Döviz tipi seçiniz.';
                            }
                            return null;
                          },
                          items: categories
                              .map<DropdownMenuItem<Category>>((value) {
                            return DropdownMenuItem<Category>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                        TextFormField(
                          controller: urunAd,
                          decoration:
                              InputDecoration(hintText: 'Ürün Adı Giriniz'),
                        ),
                        TextFormField(
                          controller: urunAdet,
                          decoration:
                              InputDecoration(hintText: 'Ürün Adeti Giriniz'),
                        ),
                        TextFormField(
                          controller: urunBilgi,
                          decoration:
                              InputDecoration(hintText: 'Ürün Bilgi Giriniz'),
                        ),
                        TextFormField(
                          controller: urunBoyut,
                          decoration:
                              InputDecoration(hintText: 'Ürün Boyut Giriniz'),
                        ),
                        TextFormField(
                          controller: urunFiyat,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration:
                              InputDecoration(hintText: 'Ürün Fiyat Giriniz'),
                        ),
                        TextFormField(
                          controller: urunKategori,
                          decoration: InputDecoration(
                              hintText: 'Ürün Kategori Giriniz'),
                        ),
                        TextFormField(
                          controller: urunRenk,
                          decoration:
                              InputDecoration(hintText: 'Ürün Renk Giriniz'),
                        ),
                        TextFormField(
                          controller: urunResim,
                          decoration:
                              InputDecoration(hintText: 'Ürün Adeti Giriniz'),
                        ),
                        ElevatedButton(
                          onPressed: () => _openFileExplorer(),
                          child: const Text("Resim Seç"),
                        ),
                        selectedPath.length > 0
                            ? Image.file(
                                File(selectedPath),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Ekle'),
        onPressed: () async {
          var bytes = File(selectedPath).readAsBytes();

          final bytess = Io.File(selectedPath).readAsBytesSync();
          // base64Encode(List<int> bytes) => base64.encode(bytes);

          Map<String, dynamic> productData = {
            'UrunAd': urunAd.text,
            'UrunAdet': urunAdet.text,
            'UrunBilgi': urunBilgi.text,
            'UrunBoyut': urunBoyut.text,
            'UrunFiyat': urunFiyat.text,
            'UrunKategori': urunKategori.text,
            'UrunRenk': urunRenk.text,
            'UrunResim': selectedPath != '' ? base64Encode(bytess) : '',
            'CategoryId': selectedCategory
          };
          await productRef.doc(urunAd.text).set(productData);
        },
      ),
    );
  }
}
