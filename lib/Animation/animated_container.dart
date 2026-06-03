import 'package:flutter/material.dart';

class container extends StatefulWidget {
  const container({super.key});
  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  var _width = 400.0;
  var _height = 200.0;
  bool flag = true;
  Color bgColor = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              height: _height,
              width: _width,
              // curve: Curves.fastLinearToSlowEaseIn,
              color: bgColor,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flag) {
                    _width = 200.0;
                    _height = 400.0;
                    bgColor = Colors.orange;
                    flag = false;
                  } else {
                    _width = 400.0;
                    _height = 200.0;
                    bgColor = Colors.blueGrey;
                    flag = true;
                  }
                });
              },
              child: Text('Animated'),
            ),
          ],
        ),
      ),
    );
  }
}
