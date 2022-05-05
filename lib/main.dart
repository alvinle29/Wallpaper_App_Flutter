import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wallpaper_app/utils/variable.dart';
import 'screens/home.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.openBox<String>(downloadBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wallpaper',
      home: const Home(),
    );
  }
}


