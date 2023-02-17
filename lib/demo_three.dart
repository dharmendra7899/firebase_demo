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
// class Democ extends StatefulWidget {
//   const Democ({Key? key}) : super(key: key);
//
//   @override
//   State<Democ> createState() => _DemocState();
// }
//
// class _DemocState extends State<Democ> {
//   final auth= FirebaseAuth.instance;
//   final ref= FirebaseDatabase.instance.ref('Thoughts');
//
//   String search='';
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
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               onChanged: ( String? value){
//                 setState(() {
//                   search=value.toString();
//                 });
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
//           Expanded(
//             child: ListView.builder(
//                 itemCount: 20,
//                 itemBuilder: (context, index){
//                   late String position= index.toString();
//                   if(searchController.text.isEmpty){
//                     return ListTile(
//                       title: Text("snapshot.child('')" +index.toString()),
//                       subtitle: Text("searchResult[index]['Thought']"),
//                     );
//                   }else if(position.toLowerCase().contains(searchController.text.toLowerCase())){
//                     return ListTile(
//                       title: Text("searchResult[index]['Name']"+position),
//                       subtitle: Text("searchResult[index]['Thought']"),
//                     );
//                   }else{
//                     return Container();
//                   }
//
//                 }),
//           )
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
