import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/utils/color.dart';

class GridViewWidget extends StatelessWidget {
  final List<Wallpaper> wallpapers;
  const GridViewWidget({Key? key, required this.wallpapers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 2 / 2.7,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: pink,
            ),
            child: Image.network(
              wallpapers[index].urls.small,
              fit: BoxFit.cover,
            ),
          )
      ),
    );
  }
}