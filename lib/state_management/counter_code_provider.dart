import 'package:flutter/material.dart';
import 'package:flutter/material.dart  ';
import 'package:provider/provider.dart';

import 'provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: Center(
        child: Text(
          '${counterProvider.getCount()}',
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterProvider.incrementCount();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterProvider.decrementCount();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
