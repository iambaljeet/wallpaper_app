import 'package:flutter/material.dart';

void main() => runApp(WallpaperApp());

class WallpaperApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Wallpapers';

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appTitle),
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
//  List<String> serverWallpaperList = [
//    "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
//    "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
//    "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
//    "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
//    "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg"
//  ];

  getWallpaperList() {
    List<String> localWallpaperList = [];
    for (var i = 0; i <= 20; i++) {
      localWallpaperList.add(
          "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg");
    }
    return localWallpaperList;
  }

  Widget buildBody(BuildContext ctxt, int index) {
    return new Card(
      child: new Image.network(getWallpaperList()[index], fit: BoxFit.cover),
      elevation: 10,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

//  Widget buildBody(BuildContext ctxt, int index) {
//    return new Card(
//      child: new Image.asset(getWallpaperList()[index], fit: BoxFit.cover),
//      elevation: 10,
//      margin: EdgeInsets.all(10.0),
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.all(
//          Radius.circular(10),
//        ),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(getWallpaperList().length, (index) {
          return buildBody(context, index);
        }),
      ),
    );
  }
}
