import 'dart:convert';
import 'package:http/http.dart' as http;
import 'wallpaper_model.dart';

class API {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var data = jsonDecode(response.body) as List<dynamic>;
    print(data);
    return data;
  }

  Future<List<dynamic>> getJsonDataFromApiSearch(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["results"];
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

  Future<List<Wallpaper>> convertJsonToSearchObject(String url) async {
    List<dynamic> list = await getJsonDataFromApiSearch(url);
    List<Wallpaper> wallpapers = [];
    for (var wallpaper in list) {
      wallpapers.add(Wallpaper.fromJson(wallpaper));
    }
    return wallpapers;
  }
}