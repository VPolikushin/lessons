import 'dart:async';

import 'package:flutter/material.dart';
import 'fetch_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Load file'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _fieldController = new TextEditingController();
  var streamController = new StreamController<String>();
  String assetsPath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _fieldController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.black,
                    onPrimary: Colors.white,
                  ),
                  onPressed: (){
                    setState(() {
                      assetsPath = 'assets/' + _fieldController.text + '.txt';
                      print(assetsPath);
                    });
                  },
                  child: Text('Найти'),
                ),
              ),
            ),
          ),
          StreamBuilder<String>(
            stream: fileFromAssets(assetsPath),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasError)
                return Center(child: Text('файл не найден'));
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Text('NONE'),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center (child: CircularProgressIndicator ());
                  break;
                case ConnectionState.done:
                  return SingleChildScrollView(child: Text(snapshot.data));
                  break;
                default:
                  return SingleChildScrollView(
                    child: Text('Default'),
                  );
              }
            },
          ),
        ],
      )
    );
  }
}
