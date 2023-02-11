import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/spotifyButtons.dart';
import 'package:myapp/models/user.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  late List<bool> prefValue;
  @override
  void initState() {
    prefValue = List.generate(Genre.values.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List<Widget>.generate(
                Genre.values.length,
                (index) {
                  return _GenrePrefRow(
                    value: prefValue[index],
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
                      setState(() {
                        prefValue[index] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SpotifyButton(
              onPressed: () {
                Navigator.pushNamed(context, "/main");
              },
              text: "Confirm",
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class _GenrePrefRow extends StatelessWidget {
  const _GenrePrefRow({
    required this.text,
    required this.onChanged,
    required this.value,
  });
  final String text;
  final void Function(bool?)? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text.padRight(8, " ").capitalizeFirst!),
        Checkbox(
          fillColor:
              MaterialStatePropertyAll<Color?>(Theme.of(context).primaryColor),
          checkColor: Theme.of(context).canvasColor,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
