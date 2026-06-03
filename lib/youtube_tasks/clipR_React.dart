import 'package:flutter/material.dart';

class ClipRReactClass extends StatelessWidget {
  const ClipRReactClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRRect')),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset('assets/images/img.png', height: 200, width: 400),
        ),
      ),
    );
  }
}
