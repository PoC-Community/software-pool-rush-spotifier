import 'package:flutter/material.dart';
import 'package:myapp/components/spotifyButtons.dart';

class ArtistCreationPage extends StatefulWidget {
  const ArtistCreationPage({super.key});

  @override
  State<ArtistCreationPage> createState() => _ArtistCreationPageState();
}

class _ArtistCreationPageState extends State<ArtistCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Form(
        child: Column(
          children: <Widget>[
            const _MyFormField(
              icon: Icons.person,
            ),
            const _MySlider(),
            const _MyFormField(
              icon: Icons.flag,
            ),
            const _MyFormField(
              icon: Icons.music_note,
            ),
            const _MyFormField(
              icon: Icons.image,
            ),
            SpotifyButton(
              onPressed: () {},
              text: "Add artists",
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class _MyFormField extends StatelessWidget {
  const _MyFormField({
    required this.icon,
  });
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          cursorColor: Theme.of(context).unselectedWidgetColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _MySlider extends StatefulWidget {
  const _MySlider();

  @override
  State<_MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<_MySlider> {
  double _currentSliderValue = 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).splashColor,
        ),
        Expanded(
          child: Slider(
            value: _currentSliderValue,
            thumbColor: Theme.of(context).splashColor,
            activeColor: Theme.of(context).unselectedWidgetColor,
            inactiveColor: Theme.of(context).cardColor,
            max: 5,
            divisions: 5,
            min: 0,
            label: _currentSliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
