import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallpaper_app/controllers/favorite_controller.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/utils/color.dart';
import '../screens/wallpaper_screen.dart';

class FavoriteWidgets extends StatelessWidget {
  const FavoriteWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
        child: GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (controller) => ValueListenableBuilder(
              valueListenable: controller.favoriteBox!.listenable(),
              builder: (context, Box<Wallpaper> box, child) {
                final List<String> keys = box.keys.cast<String>().toList();
                return keys.isEmpty
                    ? const EmptyList()
                    : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      childAspectRatio: 2 / 2.7,
                    ),
                    itemCount: keys.length,
                    itemBuilder: (context, index) {
                      final String key = keys[index];
                      final Wallpaper? wallpaper = box.get(key);
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => WallpaperScreen(
                            wallpaper: wallpaper!,
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: pink,
                            ),
                            child: Hero(
                              tag: wallpaper!.urls.regular,
                              child: Image.network(
                                wallpaper.urls.regular,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Empty List"),
    );
  }
}