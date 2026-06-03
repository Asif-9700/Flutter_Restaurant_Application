import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/todo_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow = false, nextWeek = false;

  Stream<QuerySnapshot>? todoStream;

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
  }

  void getOnTheLoad() {
    todoStream = DatabaseMethods().getallthework(
      today
          ? "Today"
          : tomorrow
          ? "Tomorrow"
          : "NextWeek",
    );
    setState(() {});
  }

  // ================= LIST =================
  Widget allWork() {
    if (todoStream == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<QuerySnapshot>(
      stream: todoStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No Tasks Found",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];

            Map<String, dynamic> data = ds.data() as Map<String, dynamic>;

            bool isDone = data.containsKey("isDone") ? data["isDone"] : false;

            return CheckboxListTile(
              activeColor: Color(0xFF279cfb),

              title: Text(
                data["Work"],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25.0,
                  color: Colors.white,
                  decoration: isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              value: isDone,

              onChanged: (newValue) async {
                await FirebaseFirestore.instance
                    .collection(
                      today
                          ? "Today"
                          : tomorrow
                          ? "Tomorrow"
                          : "NextWeek",
                    )
                    .doc(data["Id"])
                    .update({"isDone": newValue ?? false});
              },

              // DELETE ICON
              secondary: GestureDetector(
                onTap: () async {
                  bool confirm = await showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Delete"),
                      content: Text("Are you sure?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text("No"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    await FirebaseFirestore.instance
                        .collection(
                          today
                              ? "Today"
                              : tomorrow
                              ? "Tomorrow"
                              : "NextWeek",
                        )
                        .doc(data["Id"])
                        .delete();
                  }
                },
                child: Icon(Icons.cancel, color: Colors.red),
              ),

              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        );
      },
    );
  }

  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBox();
        },
        child: Icon(Icons.add, color: Color(0xFF249fff), size: 30.0),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF232FDA), Color(0xFF13D8CA), Color(0xFF09adfe)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello\nAsif Chaudhary",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Good Morning",
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
            SizedBox(height: 10),

            // FILTER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFilter("Today", today, () {
                  today = true;
                  tomorrow = false;
                  nextWeek = false;
                  getOnTheLoad();
                }),
                buildFilter("Tomorrow", tomorrow, () {
                  today = false;
                  tomorrow = true;
                  nextWeek = false;
                  getOnTheLoad();
                }),
                buildFilter("Next Week", nextWeek, () {
                  today = false;
                  tomorrow = false;
                  nextWeek = true;
                  getOnTheLoad();
                }),
              ],
            ),

            SizedBox(height: 20),

            Expanded(child: allWork()),
          ],
        ),
      ),
    );
  }

  Widget buildFilter(String text, bool selected, VoidCallback onTap) {
    return selected
        ? Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFF3dffe3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
  }

  // ================= ADD TODO =================
  Future openBox() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoController,
              decoration: InputDecoration(hintText: "Enter Text"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String id = randomAlphaNumeric(10);

                Map<String, dynamic> userTodo = {
                  "Work": todoController.text,
                  "Id": id,
                  "isDone": false,
                };

                if (today) {
                  await DatabaseMethods().addTodayWork(userTodo, id);
                } else if (tomorrow) {
                  await DatabaseMethods().addTomorrowWork(userTodo, id);
                } else {
                  await DatabaseMethods().addNextWeekWork(userTodo, id);
                }

                todoController.clear();

                if (!mounted) return;
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    ),
  );
}
