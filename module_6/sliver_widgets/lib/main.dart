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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              title: Text("Page title",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              background: Stack(
                children: [
                  Container(
                    child: Image.network('https://picsum.photos/1200/500',
                      fit: BoxFit.cover,
                    ),
                    height: double.maxFinite,
                  ),
                  Container(
                    color: Color(0xFF000000).withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt cursus nulla, scelerisque suscipit lacus bibendum eget. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eget varius lacus, in suscipit tellus. Mauris molestie condimentum turpis id auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas et ligula eu nisi ullamcorper efficitur sed ullamcorper elit. Aenean condimentum egestas congue. Donec magna tortor, tincidunt eget posuere eget, convallis vel elit. In eu laoreet risus. Aenean nec efficitur ante\n'
                    'Duis egestas sodales enim, eget interdum est bibendum a. Curabitur ullamcorper ut eros ac tincidunt. Ut ut consequat neque. Maecenas ipsum nunc, imperdiet non sodales sit amet, fermentum id erat. Ut vulputate, ipsum a elementum ultricies, eros quam aliquam purus, ac sollicitudin massa dui ac dolor. Nam vitae lobortis ipsum. Morbi dignissim lectus id finibus gravida. Nam velit felis, ultrices ac laoreet quis, ullamcorper at sem. Cras id ipsum tincidunt metus facilisis blandit. Donec eget nisl a quam tincidunt commodo vitae vel mauris. Phasellus pellentesque, neque in tincidunt condimentum, tellus enim rhoncus diam, a tempor erat ex et erat. Suspendisse non pellentesque massa. Vivamus eu hendrerit elit.\n'
                    'Quisque aliquam neque in mauris efficitur pellentesque rutrum sed sem. Nam nunc metus, rhoncus at imperdiet quis, feugiat ac sem. Donec quis feugiat diam, ut maximus purus. Nunc molestie nisl eros, sit amet pellentesque orci dictum sit amet. Duis pretium in tortor sed ultricies. Ut lacinia tempus semper. Cras non ultricies ante.\n'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt cursus nulla, scelerisque suscipit lacus bibendum eget. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eget varius lacus, in suscipit tellus. Mauris molestie condimentum turpis id auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas et ligula eu nisi ullamcorper efficitur sed ullamcorper elit. Aenean condimentum egestas congue. Donec magna tortor, tincidunt eget posuere eget, convallis vel elit. In eu laoreet risus. Aenean nec efficitur ante\n'
                    'Duis egestas sodales enim, eget interdum est bibendum a. Curabitur ullamcorper ut eros ac tincidunt. Ut ut consequat neque. Maecenas ipsum nunc, imperdiet non sodales sit amet, fermentum id erat. Ut vulputate, ipsum a elementum ultricies, eros quam aliquam purus, ac sollicitudin massa dui ac dolor. Nam vitae lobortis ipsum. Morbi dignissim lectus id finibus gravida. Nam velit felis, ultrices ac laoreet quis, ullamcorper at sem. Cras id ipsum tincidunt metus facilisis blandit. Donec eget nisl a quam tincidunt commodo vitae vel mauris. Phasellus pellentesque, neque in tincidunt condimentum, tellus enim rhoncus diam, a tempor erat ex et erat. Suspendisse non pellentesque massa. Vivamus eu hendrerit elit.\n'
                    'Quisque aliquam neque in mauris efficitur pellentesque rutrum sed sem. Nam nunc metus, rhoncus at imperdiet quis, feugiat ac sem. Donec quis feugiat diam, ut maximus purus. Nunc molestie nisl eros, sit amet pellentesque orci dictum sit amet. Duis pretium in tortor sed ultricies. Ut lacinia tempus semper. Cras non ultricies ante.\n'
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
