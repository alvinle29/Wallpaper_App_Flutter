import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wallpaper_controller.dart';
import '../model/wallpaper_model.dart';
import '../utils/color.dart';
import '../utils/style.dart';

class SetWallpaperButton extends StatelessWidget {
  final WallpaperController wallpaperController;
  final Wallpaper wallpaper;
  const SetWallpaperButton(
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
                          .setOnHomeAndLockScreen(wallpaper.urls.regular);
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