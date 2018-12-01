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
  List<String> litems = ["https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
  "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
  "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
  "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg",
  "https://cdn.pixabay.com/photo/2018/01/24/17/33/light-bulb-3104355_1280.jpg"];

  Widget buildBody(BuildContext ctxt, int index) {
    return new Card(child: new Image.network(litems[index], fit: BoxFit.cover), elevation: 10, margin: EdgeInsets.all(10.0),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: new ListView.builder
        (
          itemCount: litems.length,
          itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index)
      ),
    );
  }
}
