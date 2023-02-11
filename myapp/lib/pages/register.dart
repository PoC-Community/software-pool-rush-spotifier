import 'package:flutter/material.dart';
import 'package:myapp/components/my_textfiled.dart';
import 'package:myapp/components/spotifyButtons.dart';
import 'package:myapp/utils/api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
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
            MyTextFiled(
              hintText: "Confirm Password",
              controller: _controllerConfirmPassword,
              obscureText: true,
            ),
            SpotifyButton(
              onPressed: () async {
                if (_controllerPassword.text ==
                    _controllerConfirmPassword.text) {
                  if (await Api.register(
                    _controllerEmail.text,
                    _controllerPassword.text,
                  )) {
                    Navigator.pushNamed(context, "/main");
                  }
                }
              },
              text: "Register",
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
            )
          ],
        ),
      ),
    );
  }
}
