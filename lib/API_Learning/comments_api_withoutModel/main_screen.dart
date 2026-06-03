import 'package:first_flutter_app/API_Learning/api_services.dart';
import 'package:flutter/material.dart';

class CommentsWithoutModel extends StatefulWidget {
  const CommentsWithoutModel({super.key});

  @override
  State<CommentsWithoutModel> createState() => _CommentsWithoutModelState();
}

class _CommentsWithoutModelState extends State<CommentsWithoutModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Calling')),
      body: FutureBuilder(
        future: ApiServices().getCommentsWithoutModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: ListTile(
                      leading: Text(snapshot.data[index]["id"].toString()),
                      title: Text(
                        snapshot.data[index]["name"].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(snapshot.data[index]["body"].toString()),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
