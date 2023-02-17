import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class storeData extends StatefulWidget {
  const storeData({Key? key}) : super(key: key);

  @override
  State<storeData> createState() => _storeDataState();
}

class _storeDataState extends State<storeData> {

  TextEditingController fnameController=TextEditingController();
  TextEditingController lnameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

   late DatabaseReference dbRef;
   @override
   void initState() {
    super.initState();
    dbRef=FirebaseDatabase.instance.ref().child('Students');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Store Data"),
        centerTitle: true,
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              controller: fnameController,
              decoration: InputDecoration(
                hintText: "First Name"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: lnameController,
              decoration: InputDecoration(
                  hintText: "Last Name"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Mobile number"
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){

              Map<String, String> students={
                "First Name":fnameController.text,
                "lName": lnameController.text,
                "Mobile number":  phoneController.text
              };
              dbRef.push().set(students);
               Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneLogin()));
            }, child: Text('Submit'))
          ],
        )
      )
    );
  }
}
