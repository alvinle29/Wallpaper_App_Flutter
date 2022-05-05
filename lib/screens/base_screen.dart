import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/screens/favorite_screen.dart';
import '../controllers/base_controller.dart';
import 'home.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
        init: BaseController(),
        builder: (controller) => Scaffold(
          body: getViewByIndex(controller.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: ""),
            ],
            currentIndex: controller.currentIndex,
            onTap: (val) {
              controller.setIndex(val);
            },
          ),
        ));
  }

  Widget getViewByIndex(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const FavoriteScreen();
      default:
        return const Home();
    }
  }
}