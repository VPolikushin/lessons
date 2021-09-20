import 'package:flutter/material.dart';
import 'package:horizontal_list/utils.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = List.generate(20, (index) {
    return Container (
          width: 80,
          height: 80,
          margin: EdgeInsets.all(10),
          color: Colors.green[100],
          child: Text('$index'),
        );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          double _width = constraints.constrainWidth();
          print(_width);
          return _width < 500
              ? SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                ),
              )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                );
        },
      ),
    );
  }
}
