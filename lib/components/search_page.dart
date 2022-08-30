import 'package:flutter/material.dart';
import 'search_form.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Stock Ticker"),
      ),
      body: const SingleChildScrollView(
        child: SearchForm(),
      ),
    );
  }
}
