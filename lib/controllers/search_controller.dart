import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';
import 'base_controller.dart';

class SearchController extends BaseController {
  final API _api = API();
  List<Wallpaper> searchList = [];
  final ScrollController searchScrollController = ScrollController();
  var query = '';
  var searchPageNumber = 2;

  updateQuery(var newQuery){
    query = newQuery;
    getSearchList(query);
  }

  Future<void> getSearchList(String query) async {
    setState(true);
    searchList = await _api.convertJsonToSearchObject(api_search + "&${1}&query=$query");
    setState(false);
  }

  void loadMoreData() {
    searchScrollController.addListener(() async {
      if (searchScrollController.position.pixels ==
          searchScrollController.position.maxScrollExtent) {
        await addMoreDataToSearchList();
      }
    });
  }

  Future<void> addMoreDataToSearchList() async {
    setLoadState(true);
    List<Wallpaper> wallpapers = [];
    wallpapers = await _api.convertJsonToSearchObject(api_search + "&page=$searchPageNumber&query=$query");
    searchPageNumber++;
    searchList.addAll(wallpapers);
    setLoadState(false);
  }

  @override
  void onInit() {
    super.onInit();
    getSearchList(query);
    loadMoreData();
  }
}