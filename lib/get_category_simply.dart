import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  List _loadedPhotos = [];
  // The function that fetches data from the API
  _fetchData() async {
    const API_URL = 'https://fakestoreapi.com/products';

    final response = await http.get(Uri.parse(API_URL));
    final data = json.decode(response.body);
    print(response.body);

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kindacode.com'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _loadedPhotos.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Column(
                        children: [
                          Text(_loadedPhotos[index]["price"].toString())
                        ],
                      ),
                    );
                  }),
                // child: FutureBuilder(
                //   future: getUserApi(),
                //   builder: (context,snapshot){
                //     if(snapshot.connectionState ==ConnectionState.waiting){
                //       return Text('Loading');
                //     }else{
                //       return Text(data[0]["title"].toString());
                //
                //     }
                //   },
                // )
            )
          ],
        )
        // ListView.builder(
        //     itemCount: _loadedPhotos.length,
        //     itemBuilder: (BuildContext ctx, index) {
        //       return ListTile(
        //         leading: Image.network(
        //           _loadedPhotos[index]["avatar"],
        //           width: 150,
        //           fit: BoxFit.cover,
        //         ),
        //         title: Text(_loadedPhotos[index]['first_name']),
        //         subtitle:
        //         Text('Photo ID: ${_loadedPhotos[index]["id"]}'),
        //       );
        //     },
        //   )
    );
  }
}