import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screen.dart';
import 'package:firebase_demo/signIn.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(
          child: ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
                });
              },
              child:Text("LOGOUT")
          ),
        )
      ),
    );
  }
}
