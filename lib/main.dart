
import 'package:api_provider/category_provider/category_homepage.dart';
import 'package:api_provider/category_provider/category_provider.dart';
import 'package:api_provider/category_withoutProvider/category_HomePage1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'get_category/category_screen.dart';
import 'get_category_simply.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<CategoryProvider>(create: (BuildContext)=>CategoryProvider(),),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Category_offer(),
      ),
    );
  }
}

