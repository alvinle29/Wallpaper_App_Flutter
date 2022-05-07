import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/color.dart';
import 'package:wallpaper_app/utils/style.dart';
import '../widgets/favorite_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: h1,
        ),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
      ),
      body: const FavoriteWidgets(),
    );
  }
}