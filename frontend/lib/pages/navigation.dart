import 'package:flutter/material.dart';
import 'package:myapp/pages/artist_creation.dart';
import 'package:myapp/pages/artist_list.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Widget> _list = [
    const ArtistListPage(),
    const ArtistCreationPage()
  ];
  final List<BottomNavigationBarItem> _navList = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.list), label: "Artists List"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.create), label: "Create new Artist"),
  ];
  int _navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      body: _list[_navIndex],
    );
  }
}
