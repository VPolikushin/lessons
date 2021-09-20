import 'package:flutter/material.dart';
import 'package:list_view_divider/utils.dart';

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
  //var listData = List.generate(50, (index) => index);
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    // });
  }

    @override
    void dispose() {
      super.dispose();
      controller.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: controller,
        children: [
          Column(
            children: [
              for(final item in fakeData(50,false))
                item,
            ],
          ),
        ],
      ),
    );
  }
}
