import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Icon icon;
  final double radius;
  final void Function()? onTap;
  const CustomIcon({
    super.key, required this.icon, this.radius = 19,required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        radius: radius,
        child: icon,
      ),
    );
  }
}
