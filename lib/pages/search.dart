import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/searchPageWidgets/searchAppBar.dart';
import 'package:kelvin_weather/customWidgets/searchPageWidgets/searchBar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: searchAppBar(),
      ),
      body: CustomSearchBar(),
    );
  }
}