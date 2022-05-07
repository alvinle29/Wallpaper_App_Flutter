import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';
import 'base_controller.dart';

class HomeController extends BaseController {
  final API _api = API();

  List<Wallpaper> todayList = [];
  final ScrollController todayScrollController = ScrollController();
  int todayPageNumber = 2;

  void getTodayList() async {
    setState(true);
    todayList = await _api.convertJsonToObject(api + "&${1}");
    setState(false);
  }

  void loadMoreData() {
    todayScrollController.addListener(() async {
      if (todayScrollController.position.pixels ==
          todayScrollController.position.maxScrollExtent) {
        await addMoreDataToTodayList();
      }
    });
  }

  Future<void> addMoreDataToTodayList() async {
    setLoadState(true);
    List<Wallpaper> wallpapers = [];
    wallpapers = await _api.convertJsonToObject(api + "&page=$todayPageNumber");
    todayPageNumber++;
    todayList.addAll(wallpapers);
    setLoadState(false);
  }

  @override
  void onInit() {
    getTodayList();
    loadMoreData();
    super.onInit();
  }
}