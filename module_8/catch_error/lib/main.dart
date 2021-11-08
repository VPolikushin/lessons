import 'package:catch_error/fetch_file.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  Future<String> _calculation;
  @override
  void initState() {
    _calculation = fetchFileFromAssets('assets/data.txt');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catch error'),
      ),
      body: FutureBuilder<String>(
        future: _calculation,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError) {
            return const Center(child: Text('файл не найден'));
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('NONE'),
              );
              break;
            case ConnectionState.waiting:
              return const Center (child: CircularProgressIndicator ());
              break;
            case ConnectionState.done:
              return SingleChildScrollView(child: Text(snapshot.data.toString()));
              break;
            default:
              return const SingleChildScrollView(
                child: Text('Default'),
              );
          }
        },
      ),
    );
  }
}
