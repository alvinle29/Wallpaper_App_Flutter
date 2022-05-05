import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'download_controller.dart';

class WallpaperController extends DownloadController {
  Future<void> downloadWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    await insertImagePath(url: url, path: file.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: "Image Download",
      duration: Duration(seconds: 2),
    ));
  }

  // Set
  Future<void> setOnHomeScreen(String url) async {
    var filePath = await cachWallaper(url);
    await homeScreen(filePath.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: "The Wallpaper saved on home screen",
      duration: Duration(seconds: 2),
    ));
  }

  Future<void> setOnLockScreen(String url) async {
    var filePath = await cachWallaper(url);

    await lockScreen(filePath.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: "The Wallpaper saved on home screen",
      duration: Duration(seconds: 2),
    ));
  }

  Future<void> setOnHomeANDLOckScreen(String url) async {
    var filePath = await cachWallaper(url);
    await homeScreen(filePath.path);
    await lockScreen(filePath.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: "The Wallpaper saved on home screen",
      duration: Duration(seconds: 2),
    ));
  }

// screens
  Future<void> homeScreen(String path) async {
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.HOME_SCREEN);
  }

  Future<void> lockScreen(String path) async {
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.LOCK_SCREEN);
  }

  Future<void> lockAndhomeScreen(String path) async {
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.HOME_SCREEN);
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.LOCK_SCREEN);
  }

// download first
  Future<File> cachWallaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    return file;
  }
}
