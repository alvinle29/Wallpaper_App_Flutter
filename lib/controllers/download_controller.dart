import 'package:hive/hive.dart';
import '../utils/variable.dart';
import 'base.dart';

class DownloadController extends Base {
  Future<void> insertImagePath({String? url, String? path}) async {
    var box = await Hive.openBox<String>(downloadBox);
    box.put(url, path!);
  }
}