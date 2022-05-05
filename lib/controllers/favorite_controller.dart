import 'package:hive/hive.dart';
import 'package:wallpaper_app/utils/variable.dart';
import '../model/wallpaper_model.dart';
import 'base_controller.dart';

class FavoriteController extends BaseController {
  Box<Wallpaper>? favoriteBox;
  bool isFavorite = false;
  @override
  void onInit() {
    favoriteBox = Hive.box<Wallpaper>(FavoriteBox);
    super.onInit();
  }

  void insertWallaperToTheList(Wallpaper data) {
    Wallpaper wallpaper = Wallpaper(
        description: data.description,
        altDescription: data.altDescription,
        urls: data.urls);
    favoriteBox!.put(wallpaper.urls.regular, wallpaper);
  }

  void deleteWallpaperFromTheList(String key) {
    favoriteBox!.delete(key);
  }

  void inTheList(String key) {
    var value = favoriteBox!.get(key);
    if (value == null) {
      isFavorite = false;
    } else {
      isFavorite = true;
    }
    update();
  }

  void favoriteToggler(Wallpaper data) {
    isFavorite = !isFavorite;

    if (isFavorite) {
      insertWallaperToTheList(data);
    } else {
      deleteWallpaperFromTheList(data.urls.regular);
    }
    update();
  }
}