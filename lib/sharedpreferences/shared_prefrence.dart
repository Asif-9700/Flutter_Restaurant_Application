import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedPref extends StatefulWidget {
  const sharedPref({super.key});

  @override
  State<sharedPref> createState() => _sharedPrefState();
}

class _sharedPrefState extends State<sharedPref> {
  var nameController = TextEditingController();
  var nameValue = "No value saved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter something",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                var name = nameController.text.toString();
                var prefs = await SharedPreferences.getInstance();

                prefs.setString("name", name);
              },
              child: Text("Save", style: TextStyle(fontSize: 30)),
            ),
          ),
          SizedBox(height: 30),
          Text(nameValue),
        ],
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString("name");
    nameValue = getName ?? "No value saved";
    setState(() {});
  }
}
