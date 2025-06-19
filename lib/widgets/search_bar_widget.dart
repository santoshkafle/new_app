import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.onSearch});

  final Function(String searchQuery) onSearch;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: searchController,
      hintText: "Search Fruits...",
      onChanged: (value) {
        //somethings.....
        widget.onSearch(value);
      },
      leading: const Icon(Icons.search),
    );
  }
}
