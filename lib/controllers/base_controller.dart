import 'package:get/get.dart';

class BaseController extends GetxController {
  bool _state = false;
  bool get state => _state;
  bool _loadState = false;
  bool get loadState => _loadState;

  void setState(bool value) {
    _state = value;
    update();
  }

  void setLoadState(bool value) {
    _loadState = value;
    update();
  }

  int currentIndex = 0;
  void setIndex(val) {
    currentIndex = val;
    update();
  }
}