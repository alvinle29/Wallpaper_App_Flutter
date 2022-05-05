import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';
import 'base_controller.dart';

class HomeController extends BaseController {
  final API _api = API();

  List<Wallpaper> todayList = [];
  List<Wallpaper> popularList = [];

  final ScrollController todayScrollController = ScrollController();
  final ScrollController popularScrollController = ScrollController();

  int todayPageNumber = 2;

  void getTodayList() async {
    setState(true);
    todayList = await _api.convertJsonToObject(api + "&${1}");
    setState(false);
  }

  void getPopularList() async {
    setState(true);
    popularList = await _api.convertJsonToObject(api + "&${1}&order_by=popular");
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
    List<Wallpaper> wallpapers = [];
    wallpapers = await _api.convertJsonToObject(api + "&page=$todayPageNumber");
    todayPageNumber++;
    todayList.addAll(wallpapers);
    update();
  }

  @override
  void onInit() {
    getTodayList();
    getPopularList();
    loadMoreData();
    super.onInit();
  }
}