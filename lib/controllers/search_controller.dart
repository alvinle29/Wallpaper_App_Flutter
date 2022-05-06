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

  updateQuery(var newQuery){
    query = newQuery;
    getSearchList(query);
  }

  Future<void> getSearchList(String query) async {
    setState(true);
    print("run!!!!");
    searchList = await _api.convertJsonToSearchObject(api_search + "&${1}&query=$query");
    setState(false);
  }

  @override
  void onInit() {
    super.onInit();
    getSearchList(query);
  }
}