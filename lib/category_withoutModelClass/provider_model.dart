import 'package:flutter/cupertino.dart';

import 'http_service.dart';

class ProductProvider extends ChangeNotifier{
  List <Map<String,dynamic>> data_list=[];
  bool isloading=false;
  getdata()async{
    var  data= await ApiService().getdata();
    data_list=data;
    notifyListeners();
  }
}