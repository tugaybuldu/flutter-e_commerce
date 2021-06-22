import 'package:flutter/material.dart';
import 'package:e_commerce/login/login.dart';
import 'package:e_commerce/login/register.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
            bottom: TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Tab(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                Tab(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                'Login Page ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Login(),
              register(),
            ],
          ),
        ),
      ),
    );
  }
}
