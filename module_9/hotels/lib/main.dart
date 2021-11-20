import 'package:flutter/material.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/info_view.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case HomeView.routeName:
            return MaterialPageRoute(builder: (BuildContext context){
              return const HomeView();
            },);
          case HotelInformationView.routeName:
            final args = settings.arguments as List<dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              return HotelInformationView(uuid: args[0].toString(),name: args[1].toString());
            },);
        }
      },
    );
  }
}
