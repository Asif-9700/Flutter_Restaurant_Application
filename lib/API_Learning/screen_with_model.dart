import 'package:first_flutter_app/API_Learning/api_services.dart';
import 'package:first_flutter_app/API_Learning/post_model.dart';
import 'package:flutter/material.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});
  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  List<PostModel> postModel = [];
  bool isReady = false;
  _getPost() {
    isReady = true;
    ApiServices().getPostWithModel().then((value) {
      setState(() {
        postModel = value;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API CALL')),
      body: isReady == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(postModel[index].id.toString()),
                    title: Text(postModel[index].title.toString()),
                    subtitle: Text(postModel[index].body.toString()),
                  ),
                );
              },
            ),
    );
  }
}
