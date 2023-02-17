import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';


import 'otp.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  bool loading =false;
  TextEditingController phoneController=TextEditingController();
  final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone number"
              ),

            ),
            SizedBox(height: 40,),

            ElevatedButton(
                onPressed: (){
              // setState(() {
              //   loading=true;
              // });
              auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,

                  verificationCompleted: (_){
                  },

                  verificationFailed: (e){
                    //  Utils().toastMessage(e.toString());
                    AlertDialog alert = AlertDialog(
                      title: Text("My title"),
                      content: Text("${e.toString()}"),
                    );
                  },


                  codeSent: (String verificationId , int? token){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>verify(verificationId: verificationId,)));
              },

                  codeAutoRetrievalTimeout:  (e){
                    AlertDialog alert = AlertDialog(
                      title: Text("My title"),
                      content: Text("${e.toString()}"),
                    );

                  },);
            },

                child: Text("Get OTP"))
          ],
        ),
      ),
    );
  }
}
