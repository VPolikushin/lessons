import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TabItem {
  String title;
  Icon icon;
  TabItem({this.title, this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Photo', icon: Icon(Icons.photo)),
  TabItem(title: 'Chat', icon: Icon(Icons.chat)),
  TabItem(title: 'Albums', icon: Icon(Icons.album)),
];

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  TabController _tabController;
  int _currentTabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController _controller;
  bool _fabVisible = true;


  void toggleBottomSheet() {
    _fabVisible = false;
    if(_controller == null) {
      _controller = scaffoldKey.currentState.showBottomSheet(
            (context) => Container(
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Сумма'),
                    leading: Icon(Icons.credit_card),
                    trailing: Text('200 руб'),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('Оплатить',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[300],
                      ),
                    ),
                  ),
              ],
          ),
        ),
      );
    } else {
      _controller.close();
      _fabVisible = true;
      _controller = null;
    }
  }

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      //print('Listener: ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.person)),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 200,
                backgroundImage: NetworkImage('https://picsum.photos/1200/500'),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Images'),
              leading: Icon(Icons.image),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Files'),
              leading: Icon(Icons.file_copy),
              trailing: Icon(Icons.arrow_forward),
            ),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Выход',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300],
                  ),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Регистрация',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://picsum.photos/1200/500'),
              ),
              Text('Username'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Center(child: Text('$_fabVisible')),
          ),
          Container(
            child: Center(child: Text('Text 2')),
          ),
          Container(
            child: Center(child: Text('Text 3')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
    items: [
      for(final item in _tabBar)
        BottomNavigationBarItem(
            label: item.title,
            icon: item.icon,
        ),
        ],
      ),
      floatingActionButton: Visibility(
         child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: toggleBottomSheet,
          ),
          visible: _fabVisible,
      ),
    );
  }
}
