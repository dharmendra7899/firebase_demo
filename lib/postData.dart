import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/demo_one.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {

  TextEditingController firstnameController=TextEditingController();
  TextEditingController NnameController=TextEditingController();
  TextEditingController dateController=TextEditingController();


  late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    dbRef=FirebaseDatabase.instance.ref().child('Thoughts');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text("Post Your Thoughts".toUpperCase()),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body:Container(
            padding: EdgeInsets.all(20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(

                  controller: NnameController,
                  decoration: InputDecoration(
                    hintText: "Your name",
                    hintStyle: TextStyle(color:Colors.purple,fontWeight: FontWeight.bold),
                    fillColor: Colors.purple.shade100,
                    filled: true,
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.white,
                ),
                SizedBox(height: 30,),
                TextFormField(

                  controller: firstnameController,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: "Let's write",
                    hintStyle: TextStyle(color:Colors.purple,fontWeight: FontWeight.bold),
                    fillColor: Colors.purple.shade100,
                    filled: true,
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.white,
                ),

                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width:150,
                    child: TextFormField(
                      controller: dateController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Date",
                        hintStyle: TextStyle(color:Colors.purple,fontWeight: FontWeight.bold),
                        fillColor: Colors.purple.shade100,
                        filled: true,
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){

                  Map<String, String> students={
                    "Name" : NnameController.text,
                    "Thought":firstnameController.text,
                    "Date" :dateController.text
                  };
                  dbRef.push().set(students);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Demom()));
                },
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                    child: Text('POST'))
              ],
            )
        )
    );
  }
}
