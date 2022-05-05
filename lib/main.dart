import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wallpaper_app/screens/base_screen.dart';
import 'package:wallpaper_app/utils/variable.dart';
import 'model/url_model.dart';
import 'model/wallpaper_model.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(WallpaperAdapter());
  await Hive.openBox<Wallpaper>(FavoriteBox);
  await Hive.openBox<String>(downloadBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wallpaper',
      home: const BaseScreen(),
    );
  }
}


