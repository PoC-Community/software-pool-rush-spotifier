import 'package:flutter/material.dart';
import 'package:myapp/components/spotifyButtons.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "My Spotify",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpotifyButton(
                key: const Key("loginButton"),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                text: "Login",
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
              ),
              SpotifyButton(
                key: const Key("registerButton"),
                text: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
