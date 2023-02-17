import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_demo/postData.dart';
import 'package:firebase_demo/screen.dart';
import 'package:firebase_demo/signUp.dart';
import 'package:firebase_demo/splash.dart';
import 'package:flutter/material.dart';

class Demom extends StatefulWidget {
  const Demom({Key? key}) : super(key: key);

  @override
  State<Demom> createState() => _DemomState();
}

class _DemomState extends State<Demom> {
  final auth= FirebaseAuth.instance;
  final ref= FirebaseDatabase.instance.ref('Thoughts');
  // static List<Color> cardsColor=[
  //   Colors.green.shade100,
  //   Colors.purple.shade100,
  //   Colors.orangeAccent.shade100,
  //   Colors.yellow.shade100,
  //   Colors.blueGrey.shade100,
  // ];

  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post",style:TextStyle(color:Colors.white)),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register())));
        }, icon: Icon(Icons.logout)),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (String value){setState(() {

              });
              },
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )
              ),
            ),
          ),
            Expanded(
            child: FirebaseAnimatedList(
            query: ref,
            itemBuilder:(context, snapshot,animation, index,){
                   final title=snapshot.child('Name').value.toString();
                   if(searchController.text.isEmpty){
                     return Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: ListTile(
                         title: Text(snapshot.child('Thought').value.toString()),
                         tileColor: Colors.purple.shade100,
                         subtitle: Text(snapshot.child('Name').value.toString()),
                         trailing: Text(snapshot.child('Date').value.toString()),

                         // subtitle: Text(snapshot.child('lName').value.toString()),
                       ),
                     );
                   }else if(title.toLowerCase().contains(searchController.text.toLowerCase())){
                     return Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: ListTile(
                         title: Text(snapshot.child('Thought').value.toString()),
                         tileColor: Colors.purple.shade100,
                         subtitle: Text(snapshot.child('Name').value.toString()),
                         trailing: Text(snapshot.child('Date').value.toString()),

                         // subtitle: Text(snapshot.child('lName').value.toString()),
                       ),
                     );
                   }else{
                     return Container();
                   }

            }

            ),
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsertData()));
        },
        backgroundColor: Colors.purple,
      ),

    );
  }
}
