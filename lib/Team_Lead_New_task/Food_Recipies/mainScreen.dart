import 'package:first_flutter_app/Team_Lead_New_task/Food_Recipies/model.dart';
import 'package:first_flutter_app/Team_Lead_New_task/api_services/apiServices.dart';
import 'package:flutter/material.dart';

class Recipies extends StatefulWidget {
  const Recipies({super.key});

  @override
  State<Recipies> createState() => _RecipiesState();
}

class _RecipiesState extends State<Recipies> {
  RecipiesModel? recipiesModel;
  bool isLoading = true;

  //filter
  List recipesList = [];
  List filteredList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  //Api se data fetch ho rha hai
  void fetchData() async {
    try {
      recipiesModel = await ApiServices().getRecipiesModel();
      recipesList = recipiesModel!.recipes!;
      filteredList = recipesList;
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  //Search Function
  void filterSearch(String query) {
    List tempList = [];

    if (query.isEmpty) {
      tempList = recipesList;
    } else {
      tempList = recipesList.where((recipe) {
        return recipe.name!.toLowerCase().contains(query.toLowerCase()) ||
            recipe.cuisine!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    setState(() {
      filteredList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipes"), centerTitle: true),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 🔍 Search Bar
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: filterSearch,
                    decoration: InputDecoration(
                      hintText: "Search recipes...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                // ListView
                Expanded(
                  child: filteredList.isEmpty
                      ? const Center(child: Text("No recipes found 😢"))
                      : ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            var recipe = filteredList[index];

                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              child: ListTile(
                                contentPadding: const EdgeInsets.all(10),

                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    recipe.image ?? "",
                                  ),
                                  backgroundColor: Colors.grey.shade200,
                                ),

                                title: Text(
                                  recipe.name ?? "No Name",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                subtitle: Text(
                                  recipe.cuisine ?? "Unknown",
                                  style: const TextStyle(color: Colors.grey),
                                ),

                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
