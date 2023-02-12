import "package:flutter/material.dart";
import 'package:myapp/components/artist_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 200,
              child: ArtistList(
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
