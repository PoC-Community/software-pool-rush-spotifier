import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).hoverColor),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
