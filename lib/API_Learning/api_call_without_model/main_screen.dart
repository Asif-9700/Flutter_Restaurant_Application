import 'package:first_flutter_app/API_Learning/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});
  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Calling')),
      body: FutureBuilder(
        future: ApiServices().getPostWithoutModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data[index]["title"].toString(),
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
