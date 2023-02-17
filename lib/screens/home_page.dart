
import 'package:firebase_demo/providers/productProvider.dart';
import 'package:firebase_demo/screens/product_overview.dart';
import 'package:firebase_demo/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../search/search_all.dart';
import '../search/search_fresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider productProvider;

  Widget Listviews() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productProvider.getFreshProductDataList.map((FreshProducts) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductOverview(
                        productName: FreshProducts.productName,
                        productImage: FreshProducts.productImage.toString(),
                        productPrice: FreshProducts.productPrice.toString(),
                      )));
            },
            child: Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 165,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child:
                          Image.network(FreshProducts.productImage.toString()),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: [
                              Text("Product: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text(FreshProducts.productName),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Price: ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(FreshProducts.productPrice.toString()),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                )),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductsData();
    productProvider.fetchFreshProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);

    return Scaffold(
        backgroundColor: Colors.white70,
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.orange[400],
          title: Text("Grocery", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 20,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SearchAll()));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ))),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 20,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/2/Spinach-PNG-Clipart.png")
                          //image: NetworkImage("https://freepngimg.com/thumb/tomato/6-tomato-png-image.png")
                          ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("30% OFF",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("On all Vegetable Products",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Herbs Seasonings"),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                          },
                          child: Text(
                            "View all",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: productProvider.getHerbsProductDataList
                        .map((herbsProductData) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                    productName: herbsProductData.productName,
                                    productImage: herbsProductData.productImage
                                        .toString(),
                                    productPrice: herbsProductData.productPrice
                                        .toString(),
                                  )));
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            height: 200,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(herbsProductData
                                              .productImage
                                              .toString())),
                                      // borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        children: [
                                          Text("Product: ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          Text(herbsProductData.productName),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Price: ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text(herbsProductData.productPrice
                                              .toString()),
                                        ],
                                      ),
                                      // Text("Price: ",style:TextStyle(color:Colors.grey)),
                                    ],
                                  ),
                                ))
                              ],
                            )),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fresh Products"),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Search()));
                          },
                          child: Text(
                            "View all",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
                Listviews()
              ],
            )));
  }
}
