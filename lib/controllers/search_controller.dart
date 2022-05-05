import 'package:wallpaper_app/model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';
import 'base_controller.dart';

class SearchController extends BaseController {
  final API _api = API();
  List<Wallpaper> searchList = [];

  void getSearchList(String query) async {
    setState(true);
    searchList = await _api.convertJsonToObject(api + "&${1}&query=$query");
    setState(false);
  }
}