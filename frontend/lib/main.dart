import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/app_theme.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/pages/authpage.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/navigation.dart';
import 'package:myapp/pages/preference.dart';
import 'package:myapp/pages/register.dart';

void main() {
  runApp(const MySpotify());
}

class MySpotify extends StatefulWidget {
  const MySpotify({super.key});

  @override
  State<MySpotify> createState() => _MySpotifyState();
}

class _MySpotifyState extends State<MySpotify> {
  @override
  void initState() {
    Get.put<User>(User(
        id: "",
        email: "",
        username: "",
        password: "",
        genre: [],
        musicsLiked: [],
        artistsLiked: [],
        playlistLiked: []));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spotifiak',
      theme: mainTheme,
      home: const AuthPage(),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/main": (context) => const NavigationPage(),
        "/pref": (context) => const Preference(),
      },
    );
  }
}
