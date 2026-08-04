import 'package:flutter/material.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';

class CustomSearchBar extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var response in searchTerms) {
      if (response.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(response);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title:TextView(text: result,fontSize: 18,),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var response in searchTerms) {
      if (response.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(response);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title:TextView(text: result,fontSize: 18,),
        );
      },
    );
  }
}
