import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/signIn.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          leading: Icon(Icons.arrow_back,color: Colors.white),
          backgroundColor: Colors.purple,
          title:Text("SIGNUP"),
          centerTitle: true,
        ),
        body:Container(
            padding: EdgeInsets.all(20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Let's Register Yourself".toUpperCase(),style:TextStyle(color:Colors.purple,fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(height:80),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter Your email",
                    fillColor: Colors.purple.shade200,
                    filled: true,
                    border: InputBorder.none,
                   // focusColor: Colors.pink
                  ),
                  cursorColor: Colors.black,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Your email';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      fillColor: Colors.purple.shade200,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter your password"
                  ),
                  cursorColor: Colors.black,
                ),

                SizedBox(height: 40,),
                ElevatedButton(

                    onPressed: (){
                      auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // background
                    //  onPrimary: Colors.yellow, // foreground
                    ),
                    child: Text('SUBMIT')),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Registered ? "),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
                        },
                        child: Text("Login",style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold),)),
                  ],
                )
              ],
            )
        )
    );
  }
}
