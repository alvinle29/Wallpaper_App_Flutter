import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/wallpaper_controller.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/wallpaper_screen.dart';
import 'package:wallpaper_app/utils/color.dart';

import '../utils/style.dart';

class GridViewWidget extends StatelessWidget {
  final List<Wallpaper> wallpapers;
  final ScrollController scrollController;
  const GridViewWidget({Key? key, required this.wallpapers, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: GridView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 2 / 2.7,
          ),
          itemCount: 10,
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
    );
  }
}

class SetButton extends StatelessWidget {
  final WallpaperController wallpaperController;
  final Wallpaper wallpaper;
  const SetButton(
      {Key? key, required this.wallpaper, required this.wallpaperController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: Get.height * 0.4,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.back();
                        },
                        leading: const Text(
                          "Set Wallpaper as :",
                          style: h1,
                        ),
                        trailing: const Icon(
                          Icons.cancel_outlined,
                          color: black,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          wallpaperController
                              .setOnHomeScreen(wallpaper.urls.regular);
                          Get.back();
                        },
                        leading: const Icon(
                          Icons.home_filled,
                          color: black,
                        ),
                        title: const Text(
                          "Home Screen",
                          style: h1,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          wallpaperController
                              .setOnLockScreen(wallpaper.urls.regular);
                          Get.back();
                        },
                        leading: const Icon(
                          Icons.lock_open,
                          color: black,
                        ),
                        title: const Text(
                          "Lock Screen",
                          style: h1,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          wallpaperController
                              .setOnHomeANDLOckScreen(wallpaper.urls.regular);
                          Get.back();
                        },
                        leading: const Icon(
                          Icons.screen_lock_landscape,
                          color: black,
                        ),
                        title: const Text(
                          "Home & Lock Screen",
                          style: h1,
                        ),
                      ),
                    ],
                  ),
                ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        child: const Text(
          "SET AS",
          style: buttons,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: pink,
        ),
      ),
    );
  }
}

class WallpaperScreenButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final IconData iconData;

  const WallpaperScreenButton(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
