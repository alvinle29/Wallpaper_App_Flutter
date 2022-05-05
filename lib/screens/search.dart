import 'package:flutter/material.dart';

import '../model/API.dart';
import '../model/wallpaper_model.dart';
import '../utils/variable.dart';

class Search extends SearchDelegate {
  List<String> data = [
    "android",
    "windows",
    "mac",
    "linux",
    "parrotOS",
    "mint"
  ];

  List<String> recentSearch = [

  ];

  final API _api = API();
  List<Wallpaper> searchList = [];

  void getSearchList(String query) async {
    searchList = await _api.convertJsonToObject(api + "&${1}&query=$query");
  }

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
    if (query != null && data.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
        onTap: () {},
      );
    } else if (query == "") {
      return Text("");
    } else {
      return ListTile(
        title: Text("No results found"),
        onTap: () {},
      );
    }
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