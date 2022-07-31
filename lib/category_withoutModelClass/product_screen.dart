import 'package:api_provider/category_withoutModelClass/provider_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:provider/provider.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  void initState() {
    ProductProvider productProvider =
    Provider.of<ProductProvider>(context, listen: false);
    productProvider.getdata();

    // TODO: implement initState
    super.initState();
    // _fetchData();
  }

  List _get = [];

  // The function that fetches data from the API
  // Future<void> _fetchData() async {
  //   const apiUrl = 'http://fakestoreapi.com/products';
  //
  //   final response = await http.get(Uri.parse(apiUrl));
  //   final data = json.decode(response.body);
  //
  //   setState(() {
  //     _get = data;
  //   });
  // }
  List images = [
    "facebook.png",
    "instragram.jpeg",
    "massenger.png",
    "massenger.png",
    "massenger.png",
  ];

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    TabController _tabController = TabController(length: 5, vsync: this);
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MARENGOO",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(left: 14, right: 11),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: "NEW IN",
                          ),
                          Tab(
                            text: "MENS",
                          ),
                          Tab(
                            text: "WOMENS",
                          ),
                          Tab(
                            text: "KIDS",
                          ),
                          Tab(
                            text: "ACCESSORIES",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.maxFinite,
                    height:300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productProvider.data_list.length,
                            itemExtent: 120,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage2()));
                                      },
                                      child: Container(
                                        height:200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: productProvider.data_list.length != null
                                                ? NetworkImage(
                                                productProvider.data_list[index]['image'].toString()
                                            ) : NetworkImage(
                                              'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),

                                          // image: DecorationImage(
                                          //     image: productProvider.data_list[index]
                                          //         ['image'])

                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${productProvider.data_list![index] ["title"]}", //categoryList.categoryName.toString(),
                                      style: TextStyle(color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            }

                          // Text("dskl"),
                          // Text("bvfd"),
                          // Text("dfhbd"),
                          // Text("dfhbfgth"),
                          // Text("dfhbfgth"),
                        ),
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("img/" + images[index]),
                                    )),
                              );
                            }

                          // Text("dskl"),
                          // Text("bvfd"),
                          // Text("dfhbd"),
                          // Text("dfhbfgth"),
                          // Text("dfhbfgth"),
                        ),
                        ListView.builder(
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("img/" + images[index]),
                                    )),
                              );
                            }

                          // Text("dskl"),
                          // Text("bvfd"),
                          // Text("dfhbd"),
                          // Text("dfhbfgth"),
                          // Text("dfhbfgth"),
                        ),
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("img/" + images[index]),
                                    )),
                              );
                            }

                          // Text("dskl"),
                          // Text("bvfd"),
                          // Text("dfhbd"),
                          // Text("dfhbfgth"),
                          // Text("dfhbfgth"),
                        ),
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("img/" + images[index]),
                                    )),
                              );
                            }

                          // Text("dskl"),
                          // Text("bvfd"),
                          // Text("dfhbd"),
                          // Text("dfhbfgth"),
                          // Text("dfhbfgth"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),bottomNavigationBar: BottomAppBar(


        ),
        ));
  }
}