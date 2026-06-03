import 'package:flutter/material.dart';

class ListwheelScrollView extends StatefulWidget {
  const ListwheelScrollView({super.key});

  @override
  State<ListwheelScrollView> createState() => _ListwheelScrollViewState();
}

class _ListwheelScrollViewState extends State<ListwheelScrollView> {
  var arrIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]; // ← semicolon added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListWheelScrollView')),
      body: ListWheelScrollView(
        itemExtent: 100,
        children: arrIndex.map((value) {
          return Container(
            width: double.infinity,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }
}
