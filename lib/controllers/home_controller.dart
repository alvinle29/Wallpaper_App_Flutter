import 'package:get/get.dart';
import 'package:wallpaper_app/model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';
import 'base.dart';

class HomeController extends Base {
  final API _api = API();

  List<Wallpaper> todayList = [];
  List<Wallpaper> popularList = [];

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

  @override
  void onInit() {
    getTodayList();
    getPopularList();
    super.onInit();
  }
}