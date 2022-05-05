import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/search.dart';
import 'package:wallpaper_app/utils/color.dart';
import 'package:wallpaper_app/utils/style.dart';
import '../widgets/widget.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/home_controller.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Wallpaper",
            style: h1,
          ),
          centerTitle: true,
          backgroundColor: white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context, delegate: Search()),
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
        body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {},
          builder: (controller) {
            return TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                controller.state
                    ? const Center(child: CircularProgressIndicator(),)
                    : GridViewWidget(
                  wallpapers: controller.todayList,
                  scrollController: controller.todayScrollController,

                ),
                controller.state
                    ? const Center(child: CircularProgressIndicator(),)
                    : GridViewWidget(
                  wallpapers: controller.popularList,
                  scrollController: controller.popularScrollController,

                ),
              ],
            );
          },
        ),
      ),
    );
  }
}











/*
Container(
child: Column(
children: <Widget>[
Container(
decoration: BoxDecoration(
color: Color(0xfff5f8fd),
borderRadius: BorderRadius.circular(30.0),
),
padding: EdgeInsets.symmetric(horizontal: 24),
margin: EdgeInsets.symmetric(horizontal: 24),
child: Row(
children: <Widget>[
Expanded(
child: TextField(
decoration: InputDecoration(
hintText: "Search",
border: InputBorder.none),
),
),
Icon(Icons.search),
],
),
),
*/

