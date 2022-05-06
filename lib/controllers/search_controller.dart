import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';
import 'base_controller.dart';

class SearchController extends BaseController {
  final API _api = API();
  List<Wallpaper> searchList = [];
  final ScrollController searchScrollController = ScrollController();

  void getSearchList() async {
    const query = 'book';
    setState(true);
    searchList = await _api.convertJsonToSearchObject(api_search + "&${1}&query=$query");
    print(query);
    setState(false);
  }

  @override
  void onInit() {
    getSearchList();
    super.onInit();
  }
}