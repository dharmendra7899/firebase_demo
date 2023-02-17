import 'package:firebase_demo/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverview extends StatefulWidget {

  final String productName;
  final String productImage;
  final String productPrice;

   ProductOverview({required this.productName,required this.productImage,required this.productPrice});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
 // late ProductProvider productProvider;
  // @override
  // void initState() {
  //  ProductProvider productProvider=Provider.of(context,listen:false);
  //  productProvider.fetchHerbsProductsData();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
  //productProvider=Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text("Product Overview"),
        centerTitle: true,
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height:60,
          //color:Colors.red,
          child:Row(
            children: [
            Expanded(
              child: Container(
                height:60,
                color:Colors.black12,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite,color: Colors.red,),
                      SizedBox(width:10),
                      Text("Add to Wishlist",style:TextStyle(fontSize: 17)),
                    ],
                  )
              ),
            ),
              Expanded(
                child: Container(
                    height:60,
                    color:Colors.orange[400],
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(width:10),
                        Text("Go to Cart",style:TextStyle(fontSize: 17)),
                      ],
                    )
                ),
              )
            ],
          )
        ),
      ),
      body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child:Image.network(widget.productImage),
                  ),
                ),

            Padding(
            padding: const EdgeInsets.only(left:15,top:8),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [

            Row(
            children: [
            Text("Product: ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text(widget.productName),
            ],
            ),
            SizedBox(height: 6,),
            Row(
            children: [
            Text("Price: ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            Text(widget.productPrice.toString()),
            ],
            ),
            // Text("Price: ",style:TextStyle(color:Colors.grey)),
            ],
            ),
            ),
            SizedBox(height: 30,),
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text("About the Product",style:TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8,),
            Text("The root vegetables include beets, carrots, radishes, sweet potatoes, and turnips. Stem vegetables include asparagus and kohlrabi. Among the edible tubers, or underground stems, are potatoes. The leaf and leafstalk"
            " vegetables include brussels sprouts, and spinach.",style:TextStyle(color:Colors.grey, fontSize: 15)),
            ],
            ),
            ),
            ),
              ],
            )
      //  }).toList(),
        // children: [

        // ],

    );
  }
}
