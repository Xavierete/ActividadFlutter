import 'package:flutter/material.dart';

class RoundedView extends StatelessWidget {
  final IconData icon;
  const RoundedView({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Icon(
        icon,
        size: 48,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
