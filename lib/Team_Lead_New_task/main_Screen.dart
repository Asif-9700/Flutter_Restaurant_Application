import 'package:first_flutter_app/Team_Lead_New_task/Food_Recipies/mainScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Home Screen")),
      body: Recipies(),
    );
  }
}
