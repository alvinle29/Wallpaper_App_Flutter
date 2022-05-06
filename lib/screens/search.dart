import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import '../controllers/search_controller.dart';

class Search extends SearchDelegate {

  List<String> recentSearch = [];
  final SearchController _controller = Get.put(SearchController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    _controller.updateQuery(query);

    return GetBuilder<SearchController>(
        init: SearchController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            body: controller.state
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridViewWidget(
                    wallpapers: controller.searchList,
                    scrollController: controller.searchScrollController,
                  ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentSearch[index]),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {},
          );
        });
  }
}
