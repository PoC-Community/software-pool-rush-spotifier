import 'package:flutter/material.dart';

class SpotifyButton extends StatefulWidget {
  const SpotifyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
  });
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  @override
  State<SpotifyButton> createState() => _SpotifyButtonState();
}

class _SpotifyButtonState extends State<SpotifyButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hoverColor,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: isHovered
              ? Theme.of(context).hoverColor
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: widget.height == null ? 0 : widget.height! / 2,
            ),
          ),
        ),
      ),
    );
  }
}
