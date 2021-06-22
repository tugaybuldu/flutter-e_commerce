import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController urunAd = TextEditingController();
  TextEditingController urunAdet = TextEditingController();
  TextEditingController urunBilgi = TextEditingController();
  TextEditingController urunBoyut = TextEditingController();
  TextEditingController urunFiyat = TextEditingController();
  TextEditingController urunKategori = TextEditingController();
  TextEditingController urunRenk = TextEditingController();
  TextEditingController urunResim = TextEditingController();

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
          Map<String, dynamic> productData = {
            'UrunAd': urunAd.text,
            'UrunAdet': urunAdet.text,
            'UrunBilgi': urunBilgi.text,
            'UrunBoyut': urunBoyut.text,
            'UrunFiyat': urunFiyat.text,
            'UrunKategori': urunKategori.text,
            'UrunRenk': urunRenk.text,
            'UrunResim': urunResim.text,
          };
          await productRef.doc(urunAd.text).set(productData);
        },
      ),
    );
  }
}
