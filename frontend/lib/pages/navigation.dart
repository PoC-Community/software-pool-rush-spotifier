import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/player.dart';
import 'package:myapp/models/player.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/library.dart';
import 'package:myapp/pages/search.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Widget> _list = [
    const HomePage(),
    const Search(),
    const Library(),
  ];
  final List<BottomNavigationBarItem> _navList = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    const BottomNavigationBarItem(
      icon: Icon(Icons.library_books),
      label: "Library",
    ),
  ];
  int _navIndex = 0;
  late PlayerController playerController;
  @override
  void initState() {
    playerController = Get.find<PlayerController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MusicPlayer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).cardColor,
              selectedItemColor: Theme.of(context).primaryColorLight,
              unselectedItemColor: Theme.of(context).unselectedWidgetColor,
              onTap: (value) {
                setState(() {
                  _navIndex = value;
                });
              },
              items: _navList,
              currentIndex: _navIndex,
            ),
          ),
        ],
      ),
      body: _list[_navIndex],
    );
  }
}
