import 'package:first_flutter_app/Animation/Hero_animation/zoomScreen.dart';
import 'package:flutter/material.dart';

class firstScreen extends StatelessWidget {
  const firstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero animation')),
      body: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => zoomScreen()),
              );
            },
            child: Hero(
              tag: 'background',
              child: Image.asset(
                'assets/images/img.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
