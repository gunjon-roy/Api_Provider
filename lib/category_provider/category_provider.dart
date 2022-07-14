import 'package:api_provider/category_provider/model_category.dart';
import 'package:flutter/cupertino.dart';

import 'http_category.dart';



class CategoryProvider extends ChangeNotifier{
  List<Getcategory>?categoryList=[];
 bool isLoading =false;
 getCategoryProvider()async{
   isLoading =true;
    final data  =await ApiDataService().getCategoriesService();
    categoryList=data.getcategory!;
    print(categoryList!.length);
  isLoading =false;
    notifyListeners();


  }


}
