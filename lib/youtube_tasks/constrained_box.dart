import 'package:flutter/material.dart';

class Constrained extends StatelessWidget {
  const Constrained({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstraintsBox')),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 200, maxHeight: 200),
        child: Text('Hello World, Hello world, Hello World, Hello World'),
      ),
    );
  }
}
