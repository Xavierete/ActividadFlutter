import 'package:flutter/material.dart';

class NumberView extends StatelessWidget {
  final String text;
  final int value;
  const NumberView({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Container(
          width: 68,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
            ), // Borde
            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
          ),
          child: Text("$value"),
        ),
      ],
    );
  }
}
