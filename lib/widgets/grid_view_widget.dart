import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/wallpaper_screen.dart';
import 'package:wallpaper_app/utils/color.dart';

class GridViewWidget extends StatelessWidget {
  final List<Wallpaper> wallpapers;
  final ScrollController scrollController;
  final bool isLoading;
  const GridViewWidget({Key? key, required this.wallpapers, required this.scrollController, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: Stack(
        children: [
          GridView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: 2 / 2.7,
            ),
            itemCount: wallpapers.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => WallpaperScreen(
                          wallpaper: wallpapers[index],
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: pink,
                      ),
                      child: Hero(
                        tag: wallpapers[index].urls.regular,
                        child: Image.network(
                          wallpapers[index].urls.small,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )),
          isLoading ? const CircularProgressIndicator() : Center()
        ],
      ),
    );
  }
}

