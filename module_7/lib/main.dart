import 'dart:convert';

import 'package:flutter/material.dart';

List<bool> isHighlighted = [true, false];
List<String> texts = ['Home', 'Albums'];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context){
              return MyHomePage();
            });
          case MyAlbumsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context){
              return MyAlbumsPage();
            });
          case MyArtistInfoPage.routeName:
            final args = settings.arguments as List<dynamic>;
            return MaterialPageRoute(builder: (BuildContext context){
              print(args);
              if(args != null)
                return MyArtistInfoPage(id: args[0], name: args[1]);
            });
          default:
            return MaterialPageRoute(builder: (BuildContext context){
              return NotFound();
          });
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home page'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView.builder(
            itemCount: texts.length,
            itemBuilder: (_, index){
              return GestureDetector(
                onTap: () {
                  for (int i = 0; i < isHighlighted.length; i++) {
                    setState(() {
                      if (index == i) {
                        isHighlighted[index] = true;
                        Navigator.of(context).pushNamed('/'+'${texts[index].toLowerCase()}');
                      } else {
                        isHighlighted[i] = false;
                      }
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    texts[index],
                    style: TextStyle(
                      color: isHighlighted[index] ? Colors.blue : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


class MyAlbumsPage extends StatefulWidget {
  static const routeName = '/albums';
  const MyAlbumsPage({Key key}) : super(key: key);

  @override
  _MyAlbumsPageState createState() => _MyAlbumsPageState();
}

class _MyAlbumsPageState extends State<MyAlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/artists.json'),
        builder: (context, snapshot){
          var showData = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(showData[index]['name']),
                onTap: () {
                  Navigator.of(context).pushNamed('/artistInfo', arguments: [index, showData[index]['name']] );
                },
              );
            },
            itemCount: showData == null ? 0 : showData.length,
          );
        },
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView.builder(
            itemCount: texts.length,
            itemBuilder: (_, index){
              return GestureDetector(
                onTap: () {
                  for (int i = 0; i < isHighlighted.length; i++) {
                    setState(() {
                      if (index == i) {
                        isHighlighted[index] = true;
                        Navigator.of(context).pushNamed('/'+'${texts[index].toLowerCase()}');
                        print('/'+'${texts[index].toLowerCase()}');
                      } else {
                        isHighlighted[i] = false;
                      }
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    texts[index],
                    style: TextStyle(
                      color: isHighlighted[index] ? Colors.blue : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


class MyArtistInfoPage extends StatefulWidget {
  static const routeName = '/artistInfo';
  const MyArtistInfoPage({Key key, this.id, this.name}) : super(key: key);
  final int id;
  final String name;


  @override
  _MyArtistInfoPageState createState() => _MyArtistInfoPageState();
}

class _MyArtistInfoPageState extends State<MyArtistInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/artists.json'),
        builder: (context, snapshot){
          var showData = json.decode(snapshot.data.toString());
          return ListView(
            children: [
              SafeArea(
                  minimum: EdgeInsets.all(10),
                  child: Text(
                    showData[widget.id]['about'],
                    textAlign: TextAlign.justify,
                  ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NotFound extends StatefulWidget {
  const NotFound({Key key}) : super(key: key);

  @override
  _NotFoundState createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Not found'),
      ),
    );
  }
}
