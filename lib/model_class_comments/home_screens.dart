import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
    );
  }
}

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Post> postList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString(
      'assets/json/getposts.json',
    );

    final List<dynamic> data = json.decode(response);

    setState(() {
      postList = data.map((e) => Post.fromJson(e)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts Data"), centerTitle: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                final post = postList[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.name ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          post.email ?? '',
                          style: const TextStyle(color: Colors.blueGrey),
                        ),
                        const SizedBox(height: 8),
                        Text(post.body ?? ''),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class Post {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Post({this.postId, this.id, this.name, this.email, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
