import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/Models/productModel.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{

  late ProductModel productModel;



  //////Herbs product////////
  List<ProductModel> herbsProductList=[];

  fetchHerbsProductsData() async{
    List<ProductModel> newList=[];

    QuerySnapshot value= await FirebaseFirestore.instance.collection('HerbsProduct').get();
    debugPrint("zzzzzz${value.docs[0]["productName"]}");
    value.docs.forEach((element) {
      productModel =ProductModel(productName: element.get("productName"), productPrice: element.get("productPrice"), productImage: element.get("productImage"));
      newList.add(productModel);
      //herbsProductList.add(productModel);
    });
    herbsProductList = newList;
    notifyListeners();
    debugPrint("${herbsProductList}");
  }

  List<ProductModel>get getHerbsProductDataList{
    return herbsProductList;
  }


  ///////fresh products///////
  List<ProductModel> freshProductList=[];
  fetchFreshProductsData() async{
    List<ProductModel> newList=[];

    QuerySnapshot value= await FirebaseFirestore.instance.collection('FreshProduct').get();
    debugPrint("zzzzzz${value.docs[0]["productName"]}");
    value.docs.forEach((element) {
      productModel =ProductModel(productName: element.get("productName"), productPrice: element.get("productPrice"), productImage: element.get("productImage"));
      newList.add(productModel);
      //herbsProductList.add(productModel);
    });
    freshProductList = newList;
    notifyListeners();
    debugPrint("${freshProductList}");
  }

  List<ProductModel>get getFreshProductDataList{
    return freshProductList;
  }
}