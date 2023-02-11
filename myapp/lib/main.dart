import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/app_theme.dart';
import 'package:myapp/pages/authpage.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/navigation.dart';
import 'package:myapp/pages/register.dart';

void main() {
  runApp(const MySpotify());
}

class MySpotify extends StatelessWidget {
  const MySpotify({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spotifier',
      theme: mainTheme,
      home: const AuthPage(),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/main": (context) => const NavigationPage(),
      },
    );
  }
}
