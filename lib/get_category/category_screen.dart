

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'dart:convert' as convert;

import '../category_provider/model_category.dart';
import '../category_withoutProvider/category_model.dart';


class Category_offer extends StatefulWidget {
  const Category_offer({Key? key}) : super(key: key);
  @override
  State<Category_offer> createState() => _Category_offerState();
}

class _Category_offerState extends State<Category_offer> {
  //List<Getcategory>? categoryList ;

  Future<List<Map<String, dynamic>>> getdata() async {
    List<Map<String, dynamic>>? result = [];
    List<dynamic> data = [];

    try {
      String url = 'https://fakestoreapi.com/products';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        data = convert.jsonDecode(response.body);
        result= data.map((value) => value as Map<String, dynamic>).toList();
        // result = data.map((value) => value as Map<String, dynamic>).toList();
        print('data   ${response.body}');
        return result;
      }
    } catch (e) {
      print(' erroor  ${e.toString()}');
    }
    return result!;
  }
  // Future<CategotiesModel> getCategoriesService() async{
  //   Map<String,dynamic>? result;
  //   try{
  //     String url= 'https://bppshops.com/api/bs/category_view';
  //     http.Response response= await http.get(Uri.parse(url));
  //     print(response.body);
  //     if(response.statusCode==200){
  //
  //       result=convert.jsonDecode(response.body);
  //       return CategotiesModel.fromJson(result!);
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  //   return CategotiesModel.fromJson(result!);
  // }


  List? CategoryList;
  getData() async {
    final data = await getdata() ;
    setState(() {
      CategoryList = data;
    });
  }


  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    //getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            "All Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 30, color: Colors.grey),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 30,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoryList!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * .14,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // image: DecorationImage(
                                //   image:
                                //   NetworkImage(
                                //     "https://bppshops.com/${CategoryList![index].categoryImage}",
                                //   ),
                                //   fit: BoxFit.cover,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          SizedBox(
                            width: 90,
                            child: Text(
                              CategoryList![index]['title'].toString(), //categoryList.categoryName.toString(),
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
