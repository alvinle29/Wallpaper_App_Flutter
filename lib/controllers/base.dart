import 'package:get/get.dart';

class Base extends GetxController {
  bool _state = false;
  bool get state => _state;

  void setState(bool value) {
    _state = value;
    update();
  }
}