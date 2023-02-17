// import 'dart:ffi';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_demo/postData.dart';
// import 'package:firebase_demo/screen.dart';
// import 'package:flutter/material.dart';
//
// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   final auth= FirebaseAuth.instance;
//   final ref= FirebaseDatabase.instance.ref('Thoughts');
//
//   List searchResult=[];
//   void searchFromFirebase(String ref) async{
//     final result= await FirebaseFirestore.instance.collection('Thoughts').where('Name', arrayContains :ref).get();
//     setState(() {
//       searchResult= result.docs.map((e)=>e.data()).toList();
//     });
//   }
//   TextEditingController searchController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Post",style:TextStyle(color:Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//       ),
//       body: Column(
//         children: [
//
//       Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               onChanged: (ref){
//                 searchFromFirebase(ref);
//               },
//               controller: searchController,
//               decoration: InputDecoration(
//                   hintText: "Search",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   )
//               ),
//             ),
//           ),
//            Expanded(
//              child: ListView.builder(
//                  itemCount: searchResult.length,
//                  itemBuilder: (context, index){
//                    return ListTile(
//                      title: Text(searchResult[index]['Name']),
//                      subtitle: Text(searchResult[index]['Thought']),
//                    );
//                  }),
//            )
//         ],
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         child:Icon(Icons.add),
//         onPressed: (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsertData()));
//         },
//         backgroundColor: Colors.purple,
//       ),
//
//     );
//   }
// }
