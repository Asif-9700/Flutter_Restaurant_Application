import 'package:flutter/material.dart';

class animatedopacity extends StatefulWidget {
  const animatedopacity({super.key});

  @override
  State<animatedopacity> createState() => _animatedopacityState();
}

class _animatedopacityState extends State<animatedopacity> {
  var myOpacity = 1.0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated-Opacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: myOpacity,
              duration: Duration(seconds: 2),
              curve: Curves.bounceInOut,
              child: Container(width: 300, height: 300, color: Colors.orange),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isVisible) {
                    myOpacity = 0.0;
                    isVisible = false;
                  } else {
                    myOpacity = 1.0;
                    isVisible = true;
                  }
                });
              },
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
