import 'dart:convert';

import 'package:http/http.dart' as http;
import 'wallpaper_model.dart';
import 'package:wallpaper_app/utils/variable.dart';

class API {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var data = jsonDecode(response.body) as List<dynamic>;
    print(data);
    return data;
  }

  Future<List<Wallpaper>> convertJsonToObject(String url) async {
    List<dynamic> list = await getJsonDataFromApi(url);
    List<Wallpaper> wallpapers = [];
    for (var wallpaper in list) {
      wallpapers.add(Wallpaper.fromJson(wallpaper));
    }
    return wallpapers;
  }
}