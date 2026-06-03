import 'dart:convert';

import 'package:first_flutter_app/API_Learning/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<PostModel>> getPostWithModel() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  //api_call_without_model
  Future<dynamic> getPostWithoutModel() async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //comments_api_withoutModel
  Future<dynamic> getCommentsWithoutModel() async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );
      if (response.statusCode == 200) {
        final CommentsWithoutModel = jsonDecode(response.body);
        return CommentsWithoutModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
