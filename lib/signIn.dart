import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/screens/home_page.dart';
import 'package:firebase_demo/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_one.dart';
import 'demo_three.dart';
import 'demo_two.dart';
import 'grocery_items.dart';
import 'home.dart';
import 'login.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController eController=TextEditingController();
  TextEditingController pController=TextEditingController();
  final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.purple,
          title:Text("LOGIN"),
          centerTitle: true,
        ),
        body:Container(
            padding: EdgeInsets.all(20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LOGIN",style:TextStyle(color:Colors.purple,fontSize: 25,fontWeight: FontWeight.bold)),
                SizedBox(height:80),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: eController,
                  decoration: InputDecoration(
                      hintText: "Email",
                    fillColor: Colors.purple.shade200,
                    filled: true,
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: pController,
                  decoration: InputDecoration(
                      hintText: "Password",
                    fillColor: Colors.purple.shade200,
                    filled: true,
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),

                SizedBox(height: 40,),
                ElevatedButton(

                    onPressed: ()async{
                      auth.signInWithEmailAndPassword(email: eController.text, password: pController.text).then((value) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });


                      var sharedPref= await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.KEYLOGIN,true);


                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // background
                      //  onPrimary: Colors.yellow, // foreground
                    ),
                    child: Text('LOGIN'))
              ],
            )
        )
    );
  }
}
