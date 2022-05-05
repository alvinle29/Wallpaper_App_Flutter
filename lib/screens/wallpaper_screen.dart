import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/utils/color.dart';
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
                          CircleAvatar(
                            backgroundColor: white,
                            child: WallpaperScreenButton(
                                onPressed: () {},
                                color: pink,
                                iconData: Icons.favorite_border),
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
