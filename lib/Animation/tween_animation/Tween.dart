import 'package:flutter/material.dart';

class TweenExample extends StatefulWidget {
  const TweenExample({super.key});

  @override
  State<TweenExample> createState() => _TweenExampleState();
}

class _TweenExampleState extends State<TweenExample>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);

    animationController.addListener(() {
      print(animation.value);
      setState(() {});
    });

    animationController.forward(); // start animation
  }

  // @override
  // void dispose() {
  //   animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tween Animation")),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.pink,
        ),
      ),
    );
  }
}
