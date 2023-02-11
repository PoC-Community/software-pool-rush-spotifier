import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/user.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List<Widget>.generate(
        Genre.values.length,
        (index) {
          return _GenrePrefRow(
            text: Genre.values[index].name,
            onChanged: (value) {
              if (value != null && value) {
                Get.find<User>().genre.add(
                      Genre.values[index],
                    );
              } else {
                Get.find<User>().genre.remove(
                      Genre.values[index],
                    );
              }
            },
          );
        },
      ),
    );
  }
}

class _GenrePrefRow extends StatelessWidget {
  const _GenrePrefRow({
    required this.text,
    required this.onChanged,
  });
  final String text;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        Checkbox(
          value: false,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
