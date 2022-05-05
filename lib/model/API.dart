import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class API {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var parsedData = jsonDecode(response.body) as List<dynamic>;
    print(parsedData);
    return parsedData;
  }

  Future<List<Wallpaper>> convertJsonToObject(int pagenumber) async {
    List<dynamic> list = await getJsonDataFromApi(api + "&$pagenumber");
    List<Wallpaper> wallpapaers = [];
    for (var wallpaper in list) {
      wallpapaers.add(Wallpaper.fromJson(wallpaper));
    }
    return wallpapaers;
  }
}