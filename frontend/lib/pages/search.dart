import 'package:flutter/material.dart';
import 'package:myapp/components/artist_list.dart';
import 'package:myapp/components/search_bar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
      child: Column(
        children: const [
          SearchBar(),
          Expanded(
            child: ArtistList(),
          ),
        ],
      ),
    );
  }
}
