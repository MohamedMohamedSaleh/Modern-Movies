import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Icon icon;
  final double radius;
  const CustomIcon({
    super.key, required this.icon, this.radius = 19,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      radius: radius,
      child: icon,
    );
  }
}
