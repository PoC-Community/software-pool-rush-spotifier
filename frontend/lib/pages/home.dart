import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:myapp/components/artist_list.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  @override
  void initState() {
    user = Get.find<User>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text(
            "Welcome ${user!.username} !",
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).highlightColor,
            ),
          ),
          const Padding(
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
