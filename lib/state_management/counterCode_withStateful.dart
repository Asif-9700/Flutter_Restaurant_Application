import 'package:flutter/material.dart';

class CounterCode extends StatefulWidget {
  const CounterCode({super.key});

  @override
  State<CounterCode> createState() => _CounterCodeState();
}

class _CounterCodeState extends State<CounterCode> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provoder")),
      body: Center(child: Text('$_count', style: TextStyle(fontSize: 20))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count++;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
