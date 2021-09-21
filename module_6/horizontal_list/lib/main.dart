import 'package:flutter/material.dart';


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
  List<Color> bgColor = List.generate(10, (index) {
    int temp = 100;
    if (index == 0)
      return Colors.green[temp - 50];
    else
      return Colors.green[temp * index];
  });

  Widget buildContainer(BuildContext context, int index) {
    return Container(
      child: Text('$index'),
      height: 80,
      width: 80,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor[index], //this is the important line
      ),
    );
  }

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
                  itemCount: bgColor.length,
                  itemBuilder: (context, index) => buildContainer(context, index),
                ),
              )
              : ListView.builder(
                  itemCount: bgColor.length,
                  itemBuilder: (context, index) => buildContainer(context, index),
                );
        },
      ),
    );
  }
}
