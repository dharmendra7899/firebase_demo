

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Grocery_list extends StatefulWidget {
  const Grocery_list({Key? key}) : super(key: key);

  @override
  State<Grocery_list> createState() => _Grocery_listState();
}

class _Grocery_listState extends State<Grocery_list> {
  final auth= FirebaseAuth.instance;
  final ref= FirebaseDatabase.instance.ref().child('Grocery');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Text("Grocery"),
        centerTitle: true,
      ),
      body: Container(
           child:Column(
             children: [
               Text("Good Morning"),
               Text("Let's Order something for you!"),
               // Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
               // itemBuilder: (context, index){
               //   return Padding(
               //     padding: const EdgeInsets.all(8.0),
               //     child: Container(
               //       color:Colors.purple.shade100,
               //       child:Column(
               //         children: [
               //           Text(snapshot.child('fruit').value.toString()),
               //           Text(snapshot.child('fruit').value.toString())
               //
               //         ],
               //       )
               //     ),
               //   );
               // }))
               Expanded(child: FirebaseAnimatedList(
                   query: ref,
                   itemBuilder:(context, snapshot,animation, index,){
                     return Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Container(
                               color:Colors.purple.shade100,
                               height:150,width:MediaQuery.of(context).size.width*0.45,
                               child:Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text("Product: "+snapshot.child('products').value.toString()),
                                   Text("Price:"+snapshot.child('cc').value.toString()),
                                   Text("Price:"+snapshot.child('fruits').value.toString()),

                                 ],
                               )
                             ),
                           Container(
                               color:Colors.purple.shade100,
                               height:150,width:MediaQuery.of(context).size.width*0.45,
                               child:Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text("Product: "+snapshot.child('products').value.toString()),
                                   Text("Price:"+snapshot.child('fruit').value.toString()),
                                   Text("Price:"+snapshot.child('fruits').value.toString()),

                                 ],
                               )
                           ),
                         ],
                       ),

                     );
                   }
                              ))
             ],
           )
      ),
    );
  }
}
