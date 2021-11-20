import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/cards_widget.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  static const routeName = '/home';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  String url = 'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
  List<HotelPreview> hotels = [];
  bool isList = true;

   getData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(url));
    hotels = (jsonDecode(response.body) as List).map<HotelPreview>((_hotel) => HotelPreview.fromJson(_hotel as Map<String, dynamic>)).toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    isList = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isList = true;
              });
            },
            icon: const Icon(Icons.format_list_bulleted_sharp),
          ),
          IconButton(
              onPressed: (){
                setState(() {
                  isList = false;
                });
              },
              icon: const Icon(Icons.apps_sharp),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : isList
          ? Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6.0),
            child: ListView(
                children: <Widget>[
                  ...hotels.map((hotel) {
                     return CardListView(
                         name: hotel.name,
                         poster: hotel.poster,
                         uuid: hotel.uuid,
                     );
                  }).toList(),
                ],
              ),
          )
          : Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6.0),
            child: GridView.count(
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                crossAxisCount: 2,
                children: <Widget>[
                  ...hotels.map((hotel) {
                     return CardGridView(
                        name: hotel.name,
                        poster: hotel.poster,
                        uuid: hotel.uuid,
                    );
                  }).toList(),
                ],
            ),
          ),
    );
  }
}
