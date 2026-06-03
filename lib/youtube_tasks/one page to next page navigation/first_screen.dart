import 'package:first_flutter_app/youtube_tasks/one%20page%20to%20next%20page%20navigation/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(width: 200, height: 200, color: Colors.blue),
              Container(width: 200, height: 200, color: Colors.red),
              Container(width: 200, height: 200, color: Colors.orange),
              Container(width: 200, height: 200, color: Colors.pink),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text('Next Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
