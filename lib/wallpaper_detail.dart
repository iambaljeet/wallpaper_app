import 'package:flutter/material.dart';
import 'package:wallpaper_app/appstyles.dart' as appstyles;
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WallpaperDetail extends StatelessWidget {
  String wallpaperUrl;
  String appTitle;

  WallpaperDetail(@required String wallpaperUrl, String appTitle) {
    this.wallpaperUrl = wallpaperUrl;
    this.appTitle = appTitle;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appstyles.appTheme,
      home: WallpaperDetailScreen(appTitle, wallpaperUrl),
    );
  }
}

class WallpaperDetailScreen extends StatefulWidget {
  WallpaperDetailScreen(this.title, this.wallpaperUrl);
  final String title;
  final String wallpaperUrl;

  @override
  _WallpapersDetailState createState() => _WallpapersDetailState();
}

class _WallpapersDetailState extends State<WallpaperDetailScreen> {

  Widget buildBody(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
          Image.network(widget.wallpaperUrl, fit: BoxFit.contain),
        ],
        mainAxisSize: MainAxisSize.max)
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        leading: new IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: null),
      ),
      body: buildBody(context)
    );
  }
}