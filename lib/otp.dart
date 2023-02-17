import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/demo_one.dart';
import 'package:flutter/material.dart';


class verify extends StatefulWidget {
   final String verificationId;
  const verify({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  bool loading =false;
  TextEditingController pController=TextEditingController();
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
              controller: pController,
              decoration: InputDecoration(
                  hintText: "Enter 6 digit code"
              ),

            ),
            SizedBox(height: 40,),

            ElevatedButton(
                onPressed: () async{
                final credential= PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: pController.text.toString()
                );
                try {
                  await auth.signInWithCredential(credential);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Demom()));
                }catch(e){
                  AlertDialog alert = AlertDialog(
                    title: Text("My title"),
                    content: Text("${e.toString()}"),

                  );
                }
                },

                child: Text("Verify"))
          ],
        ),
      ),
    );
  }
}
