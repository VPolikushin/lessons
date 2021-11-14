import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hotels/models/hotel.dart';
import 'package:dio/dio.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  String url = 'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
  //List<HotelPreview> hotels = [];
  final Dio _dio = Dio();

   getData() async {
    setState(() {
      isLoading = true;
    });
    final response = await _dio.get(url);
   // response.data.map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel)).toList();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      // isLoading
      //     ? Center(child: CircularProgressIndicator(),)
      //     :
      ListView(
              // children: <Widget>[
              //   ...hotels.map((hotel) {
              //      return GestureDetector(
              //       child: Text(hotel.name),
              //     );
              //   }).toList(),
              // ],
            ),
      // Container(
      //   child: FutureBuilder<HotelPreview>(
      //     future: futureHotel,
      //     builder: (context, snapshot){
      //       switch (snapshot.connectionState) {
      //         case ConnectionState.none:
      //           return const Center(
      //             child: Text('NONE'),
      //           );
      //           break;
      //         case ConnectionState.waiting:
      //           return const Center (child: CircularProgressIndicator ());
      //           break;
      //         case ConnectionState.done:
      //           return SingleChildScrollView(child: Text(snapshot.data.toString()));
      //           break;
      //         default:
      //           return const SingleChildScrollView(
      //             child: Text('Default'),
      //           );
      //       }
      //     },
      //   ),
      // ),
    );
  }


}
