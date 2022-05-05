import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/color.dart';
import 'package:wallpaper_app/utils/style.dart';
import '../widgets/widget.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/home_controller.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: grey,
              ),
            ),
          ],
          bottom: const TabBar(
              indicatorColor: Colors.transparent,
              labelColor: pink,
              unselectedLabelColor: grey,
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
                ),
                controller.state
                    ? const Center(child: CircularProgressIndicator(),)
                    : GridViewWidget(
                  wallpapers: controller.popularList,
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

