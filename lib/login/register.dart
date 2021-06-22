import 'package:flutter/material.dart';
import 'package:e_commerce/login/LoginPage.dart';

void main() {
  runApp(register());
}

int gropvalue;

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: kayit(),
      ),
    );
  }
}

class kayit extends StatefulWidget {
  @override
  _kayitState createState() => _kayitState();
}

class _kayitState extends State<kayit> {
  int selectedRadio;

  @override
  void initstate() {
    super.initState();
    selectedRadio = 0;
  }

  setselectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      hintText: 'İsminizi giriniz')),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      hintText: 'Soyadınızı giriniz')),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'E-postanızı giriniz')),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), hintText: 'Şifrenizi giriniz'),
              ),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Şifrenizi tekrar giriniz'),
              ),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Telefon Numaranızı  giriniz'),
              ),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Text('Erkek'),
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.red,
                    onChanged: (val) {
                      setselectedRadio(val);
                    },
                  ),
                  Text('Kadın'),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: Colors.red,
                    onChanged: (val) {
                      setselectedRadio(val);
                    },
                  )
                ],
              ),
              Divider(
                height: 8,
                color: Colors.white,
              ),
              FlatButton(
                onPressed: () {},
                color: Colors.grey,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Text(
                  'Üye Ol',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              )
            ]),
          )),
    );
  }
}

/*E posta , Şifre ,Şifre tekrar , cinsiyet , telefon*/
