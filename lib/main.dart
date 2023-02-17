import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/providers/productProvider.dart';
import 'package:firebase_demo/screen.dart';
import 'package:firebase_demo/signUp.dart';
import 'package:firebase_demo/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context)=>ProductProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}
