import 'dart:convert';

import 'package:first_flutter_app/API_Learning/Api_calling/Models/PostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostModel() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Calling')),
      body: FutureBuilder(
        future: getPostModel(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          } else {
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(postList[index].title.toString()),
                          Text(postList[index].body.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
