import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'name_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> postList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString(
      'assets/json/posts.json',
    );

    final List<dynamic> data = json.decode(response);

    setState(() {
      postList = data.map((e) => PostModel.fromJson(e)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Model classes')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                final post = postList[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      post.title ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(post.body ?? ""),
                  ),
                );
              },
            ),
    );
  }
}
