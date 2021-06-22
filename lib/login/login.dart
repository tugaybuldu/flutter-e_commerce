import 'package:e_commerce/AdminPanel/AdminPage.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/login/LoginPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                hintText: 'E-Postanızı  giriniz')),
        Divider(
          color: Colors.white,
        ),
        TextField(
          obscureText: true,
          obscuringCharacter: "*",
          decoration: InputDecoration(
              icon: Icon(Icons.lock), hintText: 'Şifrenizi giriniz'),
        ),
        Divider(
          color: Colors.white,
        ),
        Divider(
          color: Colors.white,
        ),
        Divider(
          color: Colors.white,
        ),
        FlatButton(
          onPressed: () {},
          color: Colors.grey,
          height: 40,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Text(
            'Giriş Yap',
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 180.0),
          child: FlatButton(
              child: Text("AdminPage"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              }),
        )
      ]),
    );
  }
}
