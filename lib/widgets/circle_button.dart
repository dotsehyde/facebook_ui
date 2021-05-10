import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CircleButton({
    Key key,
    this.icon,
    this.iconSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      margin: const EdgeInsets.all(8),
      child: IconButton(
        iconSize: iconSize,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
