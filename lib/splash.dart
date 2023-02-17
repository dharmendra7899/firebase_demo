
import 'dart:async';


import 'package:firebase_demo/screens/home_page.dart';
import 'package:firebase_demo/signIn.dart';
import 'package:firebase_demo/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'demo_one.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0),(){
      whereToGo(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Image.asset("assets/pics/note.png")
        ),
      ),
    );



  }

  void whereToGo(BuildContext context) async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3),
            () {
          if (isLoggedIn != null) {
            if (isLoggedIn) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Register()));
            }
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Register()));
          }
        }
    );
  }



}