import 'package:flutter/material.dart';

class Stateful extends StatefulWidget {
  const Stateful({super.key});
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(child: Text('Hello this is stateful widget')),
    );
  }
}
