import 'package:flutter/material.dart';

class zoomScreen extends StatelessWidget {
  const zoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zoom screen')),
      body: Container(
        child: Hero(
          tag: 'background',
          child: Image.asset('assets/images/img.png', width: 500, height: 400),
        ),
      ),
    );
  }
}
