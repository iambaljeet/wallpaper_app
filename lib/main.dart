import 'package:flutter/material.dart';
import 'package:wallpaper_app/appstyles.dart' as appstyles;
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:wallpaper_app/wallpaper_detail.dart' as wallpaper_detail;

void main() => runApp(WallpaperApp());

ThemeData appTheme = new ThemeData(
  primarySwatch: Colors.blue
);

class WallpaperApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Wallpapers';

    return MaterialApp(
      theme: appstyles.appTheme,
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

  Widget buildBody(BuildContext ctxt, DocumentSnapshot snapshot) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
//            builder: (context) => wallpaper_detail(serverWallpaperList[index]),
          ),
        );
      },
      child: new Card(
        child: new Image.network(snapshot['wallpaperUrl'], fit: BoxFit.cover),
        elevation: 10,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.more_vert), onPressed: null)
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("wallpapers").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text('Loading...');
          return GridView.count(
          crossAxisCount: 2,
          children: List.generate(snapshot.data.documents.length, (index) {
            return buildBody(context, snapshot.data.documents[index]);
          }),
        );
        }
      ),
    );
  }
}
