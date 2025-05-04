import 'package:flutter/material.dart';
class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Hello"),
            Text("World")
          ],
        ),
        Row(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("BUTTON")),
            ElevatedButton(onPressed: (){}, child: Text("OK"))
          ],
        ),
        
      ],
    );
  }
}