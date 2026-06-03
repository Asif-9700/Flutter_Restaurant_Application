import 'dart:convert';

import 'package:first_flutter_app/Team_Lead_New_task/Food_Recipies/model.dart';
import 'package:first_flutter_app/Team_Lead_New_task/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String url = "https://69ad5ac1b50a169ec87f3769.mockapi.io/users";

  // ================= SIGNUP =================
  Future<UserModel?> signUp(UserModel user) async {
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  // ================= LOGIN =================
  Future<List<UserModel>> getUsers() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    }

    return [];
  }

  // ================= RECIPES =================
  Future<RecipiesModel> getRecipiesModel() async {
    try {
      var response = await http.get(Uri.parse("https://dummyjson.com/recipes"));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return RecipiesModel.fromJson(data);
      } else {
        throw Exception("Failed to load recipes");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
