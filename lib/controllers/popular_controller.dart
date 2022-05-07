import 'package:flutter/material.dart';
import 'package:wallpaper_app/controllers/base_controller.dart';
import '../model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';

class PopularController extends BaseController {
  final API _api = API();
  final ScrollController popularScrollController = ScrollController();
  List<Wallpaper> popularList = [];
  int popularPageNumber = 2;

  void getPopularList() async {
    setState(true);
    popularList = await _api.convertJsonToObject(api + "&${1}&order_by=popular");
    setState(false);
  }

  void loadMoreData() {
    popularScrollController.addListener(() async {
      if (popularScrollController.position.pixels ==
          popularScrollController.position.maxScrollExtent) {
        await addMoreDataToPopularList();
      }
    });
  }

  Future<void> addMoreDataToPopularList() async {
    setLoadState(true);
    List<Wallpaper> wallpapers = [];
    wallpapers = await _api.convertJsonToObject(api + "&page=$popularPageNumber&order_by=popular");
    popularPageNumber++;
    popularList.addAll(wallpapers);
    setLoadState(false);
  }

  @override
  void onInit() {
    getPopularList();
    loadMoreData();
    super.onInit();
  }

}