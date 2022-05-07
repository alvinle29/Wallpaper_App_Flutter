import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/search.dart';
import 'package:wallpaper_app/utils/color.dart';
import 'package:wallpaper_app/utils/style.dart';
import '../controllers/popular_controller.dart';
import '../widgets/grid_view_widget.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/home_controller.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool showBtn = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Wally",
              style: appName,
            ),
            centerTitle: true,
            backgroundColor: white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () =>
                    showSearch(context: context, delegate: Search()),
                icon: const Icon(
                  Icons.search,
                  color: grey,
                ),
              ),
            ],
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.black,
                indicator: DotIndicator(
                  color: Colors.black,
                  distanceFromCenter: 16,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill,
                ),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                tabs: [
                  Text(
                    "TODAY",
                    style: links,
                  ),
                  Text(
                    "POPULAR",
                    style: links,
                  ),
                ]),
          ),
          body: TabBarView(physics: const BouncingScrollPhysics(), children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridViewWidget(
                        wallpapers: controller.todayList,
                        scrollController: controller.todayScrollController,
                        isLoading: controller.loadState,
                      );
              },
            ),
            GetBuilder<PopularController>(
              init: PopularController(),
              builder: (controller) {
                return controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridViewWidget(
                        wallpapers: controller.popularList,
                        scrollController: controller.popularScrollController,
                        isLoading: controller.loadState,
                      );
              },
            ),
          ]),
        ));
  }
}
