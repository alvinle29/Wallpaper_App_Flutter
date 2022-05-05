import 'url_model.dart';
import 'package:hive/hive.dart';
part 'wallpaper_model.g.dart';

@HiveType(typeId: 0)
class Wallpaper {
  Wallpaper({
    required this.description,
    required this.altDescription,
    required this.urls,
  });

  @HiveField(0)
  String description;
  @HiveField(1)
  String altDescription;
  @HiveField(2)
  Urls urls;

  factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
    description: json["description"] ?? "",
    altDescription: json["alt_description"] ?? "",
    urls: Urls.fromJson(json["urls"]),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "alt_description": altDescription,
    "urls": urls.toJson(),
  };
}