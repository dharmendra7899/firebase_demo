import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/productProvider.dart';
import '../screens/product_overview.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    ProductProvider productProvider=Provider.of(context, listen :false);
    productProvider.fetchHerbsProductsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    productProvider=Provider.of(context);

    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[200],
          title: Text("Herbs Seasoning"),
        centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text("Items"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(

                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search items in the store",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                    ),
                    fillColor: Color(0xffe2e2e2),
                    filled: true
                  ),
                ),
              ),
              SizedBox(height:40),

          SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: productProvider.getHerbsProductDataList.map((herbsProductData){
              return  GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductOverview(productName: herbsProductData.productName, productImage: herbsProductData.productImage.toString(), productPrice:herbsProductData.productPrice.toString(),

                  )));
                },
                child: Container(
                  height:100,
                  child:Row(
                    children: [
                      Expanded(
                        child: Container(
                        child:Image.network(herbsProductData.productImage.toString())
                      ),),
                      Expanded(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment:CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text("Product: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                Text(herbsProductData.productName),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Price: ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                Text(herbsProductData.productPrice.toString()),
                              ],
                            ),
                          ],
                        ),),

                    ],
                  )
                  // child: ListTile(
                  //   title: Text(herbsProductData.productName),
                  //   subtitle: Text(herbsProductData.productPrice.toString()),
                  //   leading: Image.network(herbsProductData.productImage.toString()),
                  // ),
                ),
              );
            }).toList(),
            // children: [

            // ],
          ),
          ),
            ],
          ),
        ),
      );
  }
}

