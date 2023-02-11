import 'package:flutter/material.dart';
import 'package:myapp/components/my_textfiled.dart';
import 'package:myapp/components/spotifyButtons.dart';
import 'package:myapp/utils/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: BackButton(
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            MyTextFiled(
              hintText: "Email",
              controller: _controllerEmail,
            ),
            MyTextFiled(
              hintText: "Password",
              controller: _controllerPassword,
              obscureText: true,
            ),
            SpotifyButton(
              onPressed: () async {
                if (await Api.login(
                  _controllerEmail.text,
                  _controllerPassword.text,
                )) {
                  Navigator.pushNamed(context, "/main");
                }
              },
              text: "Login",
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
            )
          ],
        ),
      ),
    );
  }
}
