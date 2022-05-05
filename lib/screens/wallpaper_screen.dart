import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/utils/color.dart';
import '../controllers/favorite_controller.dart';
import '../controllers/wallpaper_controller.dart';
import '../widgets/widget.dart';

class WallpaperScreen extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperScreen({Key? key, required this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: wallpaper.urls.regular,
            child: Image.network(
              wallpaper.urls.regular,
              height: Get.height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WallpaperScreenButton(
                  color: white,
                  onPressed: () {
                    Get.back();
                  },
                  iconData: Icons.arrow_back_ios,
                ),
                GetBuilder<WallpaperController>(
                    init: WallpaperController(),
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: pink,
                            child: WallpaperScreenButton(
                                onPressed: () {
                                  controller.downloadWallpaper(
                                      wallpaper.urls.regular);
                                },
                                color: white,
                                iconData: Icons.file_download_outlined),
                          ),
                          SetButton(
                            wallpaper: wallpaper,
                            wallpaperController: controller,
                          ),
                          GetBuilder<FavoriteController>(
                            init: FavoriteController(),
                            initState: (con) {
                              Future.delayed(const Duration(seconds: 0))
                                  .then((value) {
                                con.controller!.inTheList(wallpaper.urls.regular);
                              });
                            },
                            builder: (controller) {
                              return CircleAvatar(
                                backgroundColor: white,
                                child: WallpaperScreenButton(
                                    onPressed: () {
                                      controller.favoriteToggler(wallpaper);
                                    },
                                    color: pink,
                                    iconData: controller.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border),
                              );
                            },
                          )
                        ],
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
