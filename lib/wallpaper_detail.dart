import 'package:flutter/material.dart';
import 'package:wallpaper_app/appstyles.dart' as appstyles;

class WallpaperDetail extends StatelessWidget {
  int wallpaperId;
  String appTitle;

  WallpaperDetail(@required int wallpaperId, String appTitle) {
    wallpaperId = wallpaperId;
    appTitle = appTitle;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: appstyles.appTheme,
      home: WallpaperDetailScreen(title: appTitle),
    );
  }
}

class WallpaperDetailScreen extends StatefulWidget {
  String appTitle;

  WallpaperDetailScreen({String title}) {
    appTitle = title;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}