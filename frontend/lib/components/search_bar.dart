import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (
      context,
      snapshot,
    ) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          cursorColor: Theme.of(context).unselectedWidgetColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
        ),
      );
    });
  }
}
